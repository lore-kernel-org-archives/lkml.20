Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFAF4AA006
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161100; cv=none; b=qIRZnIHxytHtvKhMqVcBQ7vLU9puEkHFM5pBFV1FqLbu5s6hSufbel4arLUecCehVZ1rzE1cJ45zLdS0ggxtOSuxqDVa0vAImWCMZSM6SrB/+olLBuxrD3TauxezNP+dvNVB3lSo+zT3rL0+PCSIip8xQO+YsHaDQjwpmUu0+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161100; c=relaxed/simple;
	bh=UKJqE7+IxtqC+5YzRT2/XjCHayPVfWiHfK9OjU2znL0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=m6OwR3RVML0RW13eJfHS0oqjtKxApjCrZDiH6VRh93gzg1o9l8XMG143aINwt4YLTfQhlQEXJDPa0hpIMbnJY3rec8j1szXojRN0T2Wq0GyuCR6y4k8YaWrTEY0RoqZqswCj+kFGM/XMeaaoTNtrHgMMmbalRelxQLoJKCRcF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijlDw5FQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijlDw5FQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D961F000D1;
	Fri, 16 Oct 2026 14:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161098;
	bh=VDB30oedr8blQczc4CW8OfQMYDa7UUZ9TV6LXXXnQSA=;
	h=Date:From:To:Cc:Subject:References;
	b=ijlDw5FQwowdFRGpp+hIWJwCNfVMVWHHXVHCw/Nl5FWxVfHrcPiDc/wknUuommrHv
	 ozds2qJYswyfHTWt1VLB/+r8LgMjSW+Cuv8BCslVcQeuOlatLI39psnvS415foQ7k+
	 My7JrR1B8u7YK3LgnNQWFcWV/ystAEaGlu9eZOcKStwbfL9oO7jyC9rpYa83qRaOzn
	 AXd6WjnxkrYUJ2DdtLmByBX5cek93Yaop9ie6gT5MC9Ssn9Mo3cWudHG22m41Y0GHk
	 CxbOMr3EmuLPIcYp7ke24Qu95lfPq9O6kJl11/NwTP+8QvfS0wR/kXmwblP3W0yVw6
	 /GU4hh7PbDFzw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xHiy9-00000000XqU-3sd6;
	Fri, 16 Oct 2026 10:31:37 -0400
Message-ID: <20261016143137.762707137@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 16 Oct 2026 10:31:33 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [for-next][PATCH 18/18] tracing: Print a signed histogram key as signed
References: <20261016143115.392980228@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

A histogram sorts its rows by the key named in sort=, and for a key over a
signed event field it sorts them signed: create_tracing_map_fields() picks
the comparison function with

	else
		cmp_fn = tracing_map_cmp_num(field->size,
					     field->is_signed);

hist_trigger_print_key() does not look at is_signed at all. Every numeric
key is printed with %llu, so a sorted histogram over a signed field comes
out looking unsorted. syscalls/sys_exit_lseek carries "long ret", which
SYSCALL_FIELD() marks signed and which is negative on every error:

  # echo 'hist:keys=ret:sort=ret' > events/syscalls/sys_exit_lseek/trigger
  # echo 1 > events/syscalls/sys_exit_lseek/enable
  # (five lseek(2) calls returning -ESPIPE, -EINVAL, -EBADF, 0 and 100)
  # cat events/syscalls/sys_exit_lseek/hist

  { ret: 18446744073709551587 } hitcount:          1
  { ret: 18446744073709551594 } hitcount:          1
  { ret: 18446744073709551607 } hitcount:          1
  { ret:          0 } hitcount:          1
  { ret:        100 } hitcount:          1

The rows are in ascending order and the numbers are not, because the three
leading ones are -29, -22 and -9 rendered as their two's complement.

Take the rendering from the same place the sort order comes from: the event
field when the key has one, and the hist_field itself when it does not. The
same histogram then reads

  { ret:        -29 } hitcount:          1
  { ret:        -22 } hitcount:          1
  { ret:         -9 } hitcount:          1
  { ret:          0 } hitcount:          1
  { ret:        100 } hitcount:          1

A ".buckets" key stays unsigned here, and not because it is right.
hist_field_bucket() divides as unsigned, so the group holding S64_MAX also
holds S64_MIN, reported at

  https://lore.kernel.org/all/20260914054614.82A9B1F000FF@smtp.kernel.org/

Printing that group signed would name a range that does not contain
S64_MIN, so the grouping has to be fixed with it, in a patch of its own.

Link: https://patch.msgid.link/20260917045918.370993-1-donggeunyoo.kernel@gmail.com
Fixes: 7ef224d1d0e3 ("tracing: Add 'hist' event trigger command")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_hist.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 7d3bb7da4dd1..5527605758cb 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -279,6 +279,14 @@ static u64 hist_field_pstring(struct hist_field *hist_field,
 	return (u64)(unsigned long)*addr;
 }
 
+static bool hist_field_is_signed(struct hist_field *hist_field)
+{
+	if (hist_field->field)
+		return hist_field->field->is_signed;
+
+	return hist_field->is_signed;
+}
+
 static u64 hist_field_log2(struct hist_field *hist_field,
 			   struct tracing_map_elt *elt,
 			   struct trace_buffer *buffer,
@@ -5574,7 +5582,11 @@ static void hist_trigger_print_key(struct seq_file *m,
 				   (char *)(key + key_field->offset));
 		} else {
 			uval = *(u64 *)(key + key_field->offset);
-			seq_printf(m, "%s: %10llu", field_name, uval);
+			if (hist_field_is_signed(key_field))
+				seq_printf(m, "%s: %10lld", field_name,
+					   (s64)uval);
+			else
+				seq_printf(m, "%s: %10llu", field_name, uval);
 		}
 	}
 
-- 
2.53.0
