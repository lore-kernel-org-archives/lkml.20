Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF734AB03
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788659055; cv=none; b=VGEvaHXYbqc+6JK0Cm4oZ21iOqPHY/NgOFLjted0i4XftV543mZ/9YvS0jwHbvrTcBXtj8PZnsR4znBLhU2lWu0vrLedtq7L5LPAUgFk8bzQ8qhg5GreQ5a4e3wzt0KF251xNupRqO5lrimEPRJD6AZfaR6uhUgCo2tP4IajRHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788659055; c=relaxed/simple;
	bh=F6KQeZdbVNU6nqzdbwbqOcfr7MGeBxYJ/WbkW5sRG8c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HdF0qjeUnVdsvArx73fUpq0ctV/tH0TYJ1oTlOU4niy+bGyL0BMINa0Bgbw4DByjJJaRT/Lz2QecgyWEwuIFf/vDXx2Y2dohI/rkcoZ/ZB5rgr7FTX9UQAWxT1Wj25SHqZrnjIlXMkE+ccsrrwM2tjojQsAentwqti3dyeebDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePtKCJD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePtKCJD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453431F00A3A;
	Sun,  6 Sep 2026 01:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788659054;
	bh=zLOsuJy/tiOhVClCFWf0RybPYTPcY6Fl4v6aNVup9Uo=;
	h=Date:From:To:Cc:Subject:References;
	b=ePtKCJD69ISrOnx53xRoYrhKz9sVf2wt9hU/JG0D9e/P9edTx8OeeZyd9A4D0uAMk
	 GdTW13/rocmwUIGWShXoerO6XLtHOCTN/KnrHyeS5puFvWN/O2kN5WYMu3rVwQlRhn
	 +8Of4G62Ej3iydkDnzrEel8hMivVUGeeskOqxLizUO8Rqgdc2OCmnp/cY1meaTNzfb
	 FG3tJFITVUar/HyavEojSLxCX+kI3VgSnpG/XP2j/Au9L10gZjS4RlV17F3Hk2PElm
	 cz6MpcUPphfmvy0FuBV9cdTUBajAbvAdtBw84HgHPuSLOmacXaGvFw07wVfpCDWXcF
	 rfV509cZCO/xg==
Received: from rostedt by gandalf with local (Exim 4.99.4)
	(envelope-from <rostedt@kernel.org>)
	id 1x2whP-00000006JBB-3YsZ;
	Sat, 05 Sep 2026 16:09:15 -0400
Message-ID: <20260905200915.717678123@kernel.org>
User-Agent: quilt/0.69
Date: Sat, 05 Sep 2026 16:08:33 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>,
 sashiko-bot@kernel.org
Subject: [for-linus][PATCH 06/12] ring-buffer: Add checking nr_subbufs to persistent ring buffer
 validation
References: <20260905200827.773347757@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

Sashiko reported that the code was using meta->nr_subbufs without making
sure that it matched the nr_pages + 1 on data that was assuming the two
were the same.

Add a check to the persistent ring buffer validation code to make sure
that the saved nr_subbufs matches what we expect.

Link: https://patch.msgid.link/20260903132728.7fb27d34@gandalf.local.home
Fixes: f5b95f1fa2ef3 ("ring-buffer: Validate the persistent meta data subbuf array")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260901164836.D962D1F000E9@smtp.kernel.org/
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 84fd4cdd486f..ff0a44aa578d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1856,6 +1856,11 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
 		return false;
 	}
 
+	if (meta->nr_subbufs != nr_pages + 1) {
+		pr_info("Ring buffer boot meta [%d] invalid nr_subbufs\n", cpu);
+		return false;
+	}
+
 	buffers_start = meta->first_buffer;
 	buffers_end = meta->first_buffer + (subbuf_size * meta->nr_subbufs);
 
-- 
2.53.0


