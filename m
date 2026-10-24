Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792804178;
	b=d3JYMuyIr+tNHsz0ktW/XvBs2eHmci7br4KWVwOK0iNS9hYG+i2yzi8JUzoANWxpcrnL
	 K9k5TwSSR1hdvJ4U3et1JDUBIYYCl1iulmTP7Vp2YSEbFZsazuPSysxeR9RyHBMC02+vG
	 uujn+O+fIDsMfpBqGrKyeq7gP7SAj3TSIaqMnZMUWv4Mq6wltFGmfRwjA6jkUvxfx5nnA
	 qYAYaLk7/GhmQGdEktrQg787j947SX0RM87Wz+y9Mlw6tmhDW7EtS8+5dgd8cIfVbaOiu
	 8OtjFuC15OSsol9Bk8ktgXbBS4QfiAOvejXin8yIA+ncOgAm860DA8TfvDvJ3N0v1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792804178;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Stat-Signature:X-Rspamd-Server:X-Rspamd-Queue-Id:X-Spam-Status:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=eBCjNIKUfqjaGDt0no5q2XrPUjAYAzsKAq+9d/UK+Go=;
	b=2vnWgQZ+t2Z0wJ8n6z4ImgtYOqpjeayyPAmR9lfX7k8UvopDO7o18bgAkWpS0ZaZKgH3
	 RO5dFaOVu90yPBtzvojviXJhWVJ/APs7+ONsa3XctflOUAlPka9oJplpcycHSFcGQtgmE
	 a9Wr/rj5zCN1EED7VzCa3Ltfzu93cPQy22YbItDawCkvnO61n0TwDmOxPfx+MbWv2vq9Z
	 3QLFlsNWXPELpI6Hls5rARxf7ZXxqfDKxkhcXJ0Qe+cMrop66qhKAquoSqUaQIbp02K3h
	 dVtCQ6Nm0Yn/QiBWO7OFJFZzz5Ai0ri/rcObX86qesCOaY2e1YSQVRu8H25X5JcuHQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=lQPvAeUM;
	arc=none smtp.remote-ip=216.40.44.13
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC60606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDC60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=lQPvAeUM
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id EA8DA4024E;
	Sat, 24 Oct 2026 01:09:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 574E120028;
	Sat, 24 Oct 2026 01:09:26 +0000 (UTC)
Date: Fri, 23 Oct 2026 21:09:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 =?UTF-8?B?QWRyacOhbiBHYXJjw61h?= Casado <adriangarciacasado42@gmail.com>,
 Chen Jun <chenjun102@huawei.com>, David Carlier <devnexen@gmail.com>,
 Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Haoran Wang
 <haoranwangsec@gmail.com>, Kyle Zeng <kylebot@openai.com>, Lee Jones
 <lee@kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, Vincent Donnefort
 <vdonnefort@google.com>
Subject: [GIT PULL] tracing: Updates for v7.4
Message-ID: <20261023210925.3dddff9e@fedora>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: 3akdyjsxbtu167eg6my335qg7mz3dptg
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 574E120028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19s9ynh/NHPDcmAJWjMQbDUIHi0HFMGvdo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=eBCjNIKUfqjaGDt0no5q2XrPUjAYAzsKAq+9d/UK+Go=; b=lQPvAeUM7ppyjOsRL5CTHiKxwRfBu79+ByN0kSEQZAyQKFDE2SrM1mDFoBX2Bf6JNVk+6QoTqAUbf6D7dbpQu9p/nJfUqpSVuA6icAsbCVU0HsOmykaar7YPTyHZ3UqjwzLx7VRUqvtMm8r0Uv5SvUD8M1jU78SYGC/OVNPj1EA=
X-HE-Tag: 1792804166-847795
X-HE-Meta: U2FsdGVkX1+piJXsRIhj1ln7eGg1e8ZCXuZ/pE1clPqlXFczKmDKiSiTrOiCZLA/RVh6EPAzIViJIdGf8kAba7744bhEeSasXX/4Bw35KUDX09vLc1vqA3AuTnfM81pnDI5XR1YQkjl3r+JTcg6bc7BHQoWTbGb2wQ+zNLs2I/dzC3Ecqx6MpWuUW+wU7hPf9dVQmoF79/W241X+h9pD5QKTLWC/M7ZnS0xA0y7JfQG/tG/bVW/HbZ1/dOXcxHa/MsTMF1cR/4Djgg7TdBgKxnRz2v22tqSzvID0UFTf0+J3o/d/wfeywK9uaNWfNT1mTVMdcPfIOfqNoB7lRaVgHHL9ysyV8IX2


Linus,

[ Sorry for the late pull request, I was waiting for some last minute fixes=
 ]

tracing updates for v7.4:

- Add "within" to filter logic

  Add a way to trace events by what function they fall in.

  echo 'within =3D=3D "vfs_read" > events/sched/sched_switch/filter

  Will only trigger sched_switch events that happen within the vfs_read
  function. It uses a stacktrace at the event and checks if any entry is
  within the specified function and if so, it prints the event.

- Remove a duplicate definition of ftrace_set_clr_event() from the header

- Do not have ftrace_set_clr_event() modify its input buffer

  Have the buffer passed into ftrace_set_clr_event() to be const char * and
  not allow modifications to it that might cause side effects.

- Add kunit tests for ftrace_parse_event_string()

- Add filter argument to __ftrace_set_clr_event()

  Make it possible to set a filter on an event at the same time it is
  enabled.

- Add event filtering logic to the kernel command line

  To allow filtering events on boot, allow filtering to be specified on the
  kernel command line when enabling events.

- Rename "ring_buffer_size()" to "ring_buffer_capacity()"

  "size" refers to how much is allocated whereas the actual return value is
  the amount of available data in the ring buffer minus its meta data.

- Rename "trace_array_entries" to "trace_array_capacity"

  There's several functions that use "entries" and returns the amount of
  data that that is usable. "entries" should be only for the number of
  events, not the amount of data.

- Print the histogram "bucket" size as unsigned.

  If a bucket size is LONG_MAX, then it shows up as a negative number.

- Show bucket size in output of histograms

  The output of what the histogram is shown doesn't show the size of the
  buckets when buckets are used. The output should be the same as the input
  and since specifying buckets without a size is an invalid command, the
  output to display what was entered should also show the size.

- Fix stacktrace modifier output

  Only show the stacktrace modifier when it was specified in creation.

- Unregister filed variable histograms when the command fails

  If one histogram references a variable of another histogram it registers
  that other histogram. But if the first histogram fails in setup after it
  registered the other histogram it doesn't unregister it. Have the first
  histogram add the reference to the other histogram so the failure clean up
  will unregister the second histogram too.

- Fix 64-bit signed histogram fields on 32-bit kernels

  A fix to convert char * to u64 with added casting also incorrectly added
  an intermediate cast to convert a long value to u64 which ended up
  truncating the upper 32 bits for 32-bit kernels. Remove the intermediate
  typecast.

- Print signed histogram keys as signed

  Histogram keys were being printed as unsigned and with signed keys it was
  giving the wrong output.

- Use copy_from_user() and not __copy_from_user() in syscall tracing

  The syscall tracing incorrectly was using __copy_from_user() which could
  be an issue if the system trusts perf doing the trace.

- Take trace_types_lock when recording a new module in persistent buffer

  When a new module is loaded, the persistent ring buffer saves it in its
  persistent memory. All the trace_arrays are iterated looking for any
  persistent buffer to add the module to. But it did not hold the
  trace_types_lock meaning a trace_array could be added or removed while
  iterating the list.

- Only create tracepoint guest_halt_poll_ns when it is used

  The tracepoint guest_halt_poll_ns is defined in the power management code
  but it is only used when CONFIG_CPU_IDLE_GOV_HALTPOLL is enabled. This
  wastes memory when that config isn't enabled so wrap the tracepoint around
  that as well.

- Handle empty fields for events in trace_event_get_offsets()

  The user events could have empty fields and this causes
  trace_event_get_offsets() to crash as it expects events to always have
  fields. Make the function handle events with no fields.

- Reject incomplete event filter expressions

  If a filter has an incomplete expression (common_pid =3D=3D 1111 || ), it=
 will
  cause a out-of-bounds bug. Have the predicate_parse() only process the
  expression if it is complete.


Please pull the latest trace-v7.4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.4

Tag SHA1: 528d55aeb09e34f35cc716fe770fdda13a3014a9
Head SHA1: 1fdc4164e488916402badddbb1f51e9380dabb91


Adri=C3=A1n Garc=C3=ADa Casado (1):
      tracing/osnoise: Add __printf attribute to osnoise_print()

Chen Jun (1):
      tracing: Add "within" filter for call-stack-based event filtering

David Carlier (2):
      tracing: Hold trace_types_lock when updating modules in persistent in=
stances
      tracing: Hold trace_types_lock when resetting last boot data from rea=
ders

Donggeun Yoo (8):
      tracing: Print the bucket size as unsigned
      tracing: Add the bucket size to expr_field_str()
      tracing: Only report the stacktrace modifier on a real field
      tracing: Unregister field variable histograms when the command fails
      tracing: Clamp the printed end of a histogram bucket at U64_MAX
      tracing: Fix 64-bit and signed histogram fields on 32-bit kernels
      tracing: Print a signed histogram key as signed
      tracing: Save the event file instead of the compatible histogram

Haoran Wang (2):
      tracing/syscalls: Use copy_from_user for the faultable syscall buffer
      tracing: Guard trace_event_get_offsets() against an empty fields list

Kyle Zeng (1):
      tracing: Reject incomplete event filter expressions

Lee Jones (1):
      tracing/histograms: Verify event_call identity when updating synth_ev=
ent refcount

Steven Rostedt (2):
      tracnig: Add proper error message for glob use with "within" filter
      cpuidle: haltpoll: Only define guest_halt_poll_ns tracepoint when used

Thomas Wei=C3=9Fschuh (6):
      tracing: Remove duplicate declaration of ftrace_set_clr_event()
      tracing: Stop modifying the input buffer in ftrace_set_clr_event()
      tracing: Split the event string parsing logic into a dedicated functi=
on
      tracing: Add a test for ftrace_parse_event_string()
      tracing: Add a filter argument to __ftrace_set_clr_event()
      tracing: Parse filter from boot event string

Vincent Donnefort (3):
      ring-buffer: Rename ring_buffer_size() to ring_buffer_capacity()
      tracing: Rename trace_array::entries to capacity
      tracing: Rename tracing_entries_fops to tracing_capacity_fops

----
 Documentation/admin-guide/kernel-parameters.txt    |   9 +-
 Documentation/trace/events.rst                     |  17 +++
 Documentation/trace/histogram.rst                  |   3 +
 include/linux/ring_buffer.h                        |   2 +-
 include/linux/trace_events.h                       |   3 +-
 include/trace/events/power.h                       |   3 +
 kernel/trace/Kconfig                               |   8 ++
 kernel/trace/Makefile                              |   1 +
 kernel/trace/ring_buffer.c                         |  13 +-
 kernel/trace/trace.c                               |  72 ++++++-----
 kernel/trace/trace.h                               |  13 +-
 kernel/trace/trace_boot.c                          |   2 +-
 kernel/trace/trace_events.c                        | 132 +++++++++++++----=
----
 kernel/trace/trace_events_filter.c                 |  50 +++++++-
 kernel/trace/trace_events_hist.c                   |  61 ++++++----
 kernel/trace/trace_events_synth.c                  |  10 ++
 kernel/trace/trace_events_test.c                   | 122 +++++++++++++++++=
++
 kernel/trace/trace_osnoise.c                       |   1 +
 kernel/trace/trace_snapshot.c                      |  14 +--
 kernel/trace/trace_synth.h                         |   1 +
 kernel/trace/trace_syscalls.c                      |   2 +-
 .../test.d/filter/event-filter-incomplete.tc       |  24 ++++
 22 files changed, 440 insertions(+), 123 deletions(-)
 create mode 100644 kernel/trace/trace_events_test.c
 create mode 100644 tools/testing/selftests/ftrace/test.d/filter/event-filt=
er-incomplete.tc
---------------------------
