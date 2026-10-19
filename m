Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437841;
	b=Wwk/qnvhs2q0yvL3d9X4sOl1yZpS1P0n7/9852L+sZtlnfu6GjBUhvFx492FvmMxSayo
	 QqpsOCf58q5nb1W48mbVV9fp9zAxVYV9NZb3lls+6dezoNiSSzt7CtT78ziCRzp6As6WN
	 TO/30wxdztbzpk8Wi/gvv5OltbaHxf/AnRQ4eMqvUAyPYtDjbDrde7DOVgmjp7Zm8c05R
	 usSEXvxf8XkoD2w4HRMKNW7uQ/EnI3bz2hhvt5t3h2vwbYQDl/yekYGvv2NXUneumVVJU
	 fDs3Fj7+8BVl5Bq1UIMed9QihhbFeepxKMXXecI/d6z1TLwTX/h3Oyqol3MePXRUj5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437841;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=eidxh8vx88yPl+plMn+6fihm0m5HVFYJ+I1a/XoPYmI=;
	b=3OWtxWwuJ85NPC+Gn7oSBzyCYI8DFUI1R88FLrte2HNj7KAcmtaAO4Y1E/oETCzUbkLt
	 HUucnZryrzqB41V698hIdZkchTIWFqiyWVBX8gWZeIVXiFgoNRmsKQ/0xqpzGZ4pbN2p0
	 aFhT/h0/sFRLU2KgQ2smLotAXdNHGujMwHbZaCKQ+sVd+oF9DG4+wEPiUFcHtxSuh62vi
	 F7aRIU/34rIzxjPEUGJz8z5h3yR/NzhzBuRmdg7KiCnb7o42Qbkl7OF8v0KwtLzxtZzth
	 9RA0LRvQb8WpB7lpxrWYS6uhGmPy7kWOcjeveKKwO+PKxtu8pYn5JgPpw04wed+eboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xrv8Jl7q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26B8606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xrv8Jl7q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1E41F000C5;
	Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437840;
	bh=eidxh8vx88yPl+plMn+6fihm0m5HVFYJ+I1a/XoPYmI=;
	h=Date:From:To:Cc:Subject:References;
	b=Xrv8Jl7qL4vL435OfvrnWoA7ZA4+l5+z6UaOcXYwYuRElF3DPkfUU0Prr8cwUKYGN
	 i0J1QBVZPfWQLtSYHcA1dteVxf8C1ZEr1LaY6YA3W+8DKWLZ80Cx9trA9lr28k1Wwq
	 ks3jRNjFMjKU2LI4YQoXajyR43APPo8Qvy8PhmFi4OSgOvrI8SDjj8ta8xL+qhr85k
	 RQ/65vOKO9BdaTRGToiDQTbn9TzDNNgeuTN+1f5p+41LZ3zpzqCLrVM5smhp6/jGiG
	 yPASancfNu1d6Z7LHLoMwkJ0wgQgMZp2RR4yyjTiaabwlUVh+Kaip43r95B2dxrq8J
	 rDxx0BaxhqQPA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxk-00000001eHX-0ZgO;
	Mon, 19 Oct 2026 15:24:00 -0400
Message-ID: <20261019192359.949776575@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:49 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>,
 pengdonglin <pengdonglin@xiaomi.com>
Subject: [for-next][PATCH 5/9] tracing: Update funcgraph-retval documentation
References: <20261019192344.004592683@kernel.org>
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

From: pengdonglin <pengdonglin@xiaomi.com>

The existing documentation for funcgraph-retval is outdated and partially
incorrect, as it describes limitations that have now been resolved.

Recent changes (e.g., using BTF to obtain function return types) have
addressed key issues:
1. Return values are now printed only for non-void functions.
2. Values are trimmed to the correct width of the return type, avoiding
   garbage data from high bits.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>
Link: https://patch.msgid.link/20260916133218.1282590-5-dolinux.peng@gmail.com
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 Documentation/trace/ftrace.rst | 96 ++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 38 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 7261f25f8b4b..9423722848c6 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -1483,6 +1483,10 @@ Options for function_graph tracer:
 	printed in hexadecimal format. By default, this option
 	is off.
 
+  funcgraph-retaddr
+	When set, the return address will always be printed.
+	By default, this option is off.
+
   sleep-time
 	When running function graph tracer, to include
 	the time a task schedules out in its function.
@@ -2829,7 +2833,7 @@ It is default disabled.
     0)   2.861 us    |      } /* putname() */
 
 The return value of each traced function can be displayed after
-an equal sign "=". When encountering system call failures, it
+an equal sign "ret=". When encountering system call failures, it
 can be very helpful to quickly locate the function that first
 returns an error code.
 
@@ -2839,16 +2843,16 @@ returns an error code.
   Example with funcgraph-retval::
 
     1)               |    cgroup_migrate() {
-    1)   0.651 us    |      cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
+    1)   0.651 us    |      cgroup_migrate_add_task(); /* ret=0xffff93fcfd346c00 */
     1)               |      cgroup_migrate_execute() {
     1)               |        cpu_cgroup_can_attach() {
     1)               |          cgroup_taskset_first() {
-    1)   0.732 us    |            cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
-    1)   1.232 us    |          } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
-    1)   0.380 us    |          sched_rt_can_attach(); /* = 0x0 */
-    1)   2.335 us    |        } /* cpu_cgroup_can_attach = -22 */
-    1)   4.369 us    |      } /* cgroup_migrate_execute = -22 */
-    1)   7.143 us    |    } /* cgroup_migrate = -22 */
+    1)   0.732 us    |            cgroup_taskset_next(); /* ret=0xffff93fc8fb20000 */
+    1)   1.232 us    |          } /* cgroup_taskset_first ret=0xffff93fc8fb20000 */
+    1)   0.380 us    |          sched_rt_can_attach(); /* ret=0x0 */
+    1)   2.335 us    |        } /* cpu_cgroup_can_attach ret=-22 */
+    1)   4.369 us    |      } /* cgroup_migrate_execute ret=-22 */
+    1)   7.143 us    |    } /* cgroup_migrate ret=-22 */
 
 The above example shows that the function cpu_cgroup_can_attach
 returned the error code -22 firstly, then we can read the code
@@ -2859,43 +2863,55 @@ be displayed in a smart way. Specifically, if it is an error code,
 it will be printed in signed decimal format, otherwise it will
 printed in hexadecimal format.
 
+When CONFIG_DEBUG_INFO_BTF is enabled, the smart format also takes the
+declared return type into account. Signed integer and signed enum return
+values are printed in signed decimal format, unsigned enum return values
+are printed in unsigned decimal format, and unsigned integer, pointer, and
+aggregate return values are printed in hexadecimal format. Boolean return
+values are printed as ``true`` or ``false``. If the BTF type is unavailable,
+the legacy error-code detection is used.
+
 	- smart: echo nofuncgraph-retval-hex > trace_options
 	- hexadecimal: echo funcgraph-retval-hex > trace_options
 
   Example with funcgraph-retval-hex::
 
     1)               |      cgroup_migrate() {
-    1)   0.651 us    |        cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
+    1)   0.651 us    |        cgroup_migrate_add_task(); /* ret=0xffff93fcfd346c00 */
     1)               |        cgroup_migrate_execute() {
     1)               |          cpu_cgroup_can_attach() {
     1)               |            cgroup_taskset_first() {
-    1)   0.732 us    |              cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
-    1)   1.232 us    |            } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
-    1)   0.380 us    |            sched_rt_can_attach(); /* = 0x0 */
-    1)   2.335 us    |          } /* cpu_cgroup_can_attach = 0xffffffea */
-    1)   4.369 us    |        } /* cgroup_migrate_execute = 0xffffffea */
-    1)   7.143 us    |      } /* cgroup_migrate = 0xffffffea */
-
-At present, there are some limitations when using the funcgraph-retval
-option, and these limitations will be eliminated in the future:
-
-- Even if the function return type is void, a return value will still
-  be printed, and you can just ignore it.
-
-- Even if return values are stored in multiple registers, only the
-  value contained in the first register will be recorded and printed.
-  To illustrate, in the x86 architecture, eax and edx are used to store
-  a 64-bit return value, with the lower 32 bits saved in eax and the
-  upper 32 bits saved in edx. However, only the value stored in eax
-  will be recorded and printed.
-
-- In certain procedure call standards, such as arm64's AAPCS64, when a
-  type is smaller than a GPR, it is the responsibility of the consumer
-  to perform the narrowing, and the upper bits may contain UNKNOWN values.
-  Therefore, it is advisable to check the code for such cases. For instance,
-  when using a u8 in a 64-bit GPR, bits [63:8] may contain arbitrary values,
-  especially when larger types are truncated, whether explicitly or implicitly.
-  Here are some specific cases to illustrate this point:
+    1)   0.732 us    |              cgroup_taskset_next(); /* ret=0xffff93fc8fb20000 */
+    1)   1.232 us    |            } /* cgroup_taskset_first ret=0xffff93fc8fb20000 */
+    1)   0.380 us    |            sched_rt_can_attach(); /* ret=0x0 */
+    1)   2.335 us    |          } /* cpu_cgroup_can_attach ret=0xffffffea */
+    1)   4.369 us    |        } /* cgroup_migrate_execute ret=0xffffffea */
+    1)   7.143 us    |      } /* cgroup_migrate ret=0xffffffea */
+
+Note that there are some limitations when using the funcgraph-retval
+option:
+
+- If CONFIG_DEBUG_INFO_BTF is disabled (n), a return value is printed even for
+  functions with a void return type. When CONFIG_DEBUG_INFO_BTF is enabled (y),
+  the return value is printed only for non-void functions.
+
+- If a return value occupies multiple registers, only the value in the first
+  register is recorded and printed. For example, on the x86 architecture, a
+  64-bit return value is stored across eax (lower 32 bits) and edx (upper 32 bits),
+  but only the contents of eax are captured. If CONFIG_DEBUG_INFO_BTF is enabled,
+  the suffix "(trunc)" is appended to the printed value to indicate that the
+  output may be truncated because high-order register contents are omitted.
+
+- Under certain procedure-call standards (e.g., arm64's AAPCS64), when the return
+  type is smaller than a general-purpose register (GPR), the caller is responsible
+  for narrowing the value; the upper bits of the register may contain undefined data.
+  For instance, when a u8 is returned in 64-bit GPR, bits [63:8] can hold arbitrary
+  values, especially when larger types are truncated (explicitly or implicitly). It
+  is therefore advisable to inspect the code in such cases. If CONFIG_DEBUG_INFO_BTF
+  is enabled (y), the return value is automatically trimmed to the width of the return
+  type.
+
+  The following examples illustrate the behavior:
 
   **Case One**:
 
@@ -2914,7 +2930,9 @@ option, and these limitations will be eliminated in the future:
 		RET
 
   If you pass 0x123456789abcdef to this function and want to narrow it,
-  it may be recorded as 0x123456789abcdef instead of 0xef.
+  it may be recorded as 0x123456789abcdef instead of 0xef. When
+  CONFIG_DEBUG_INFO_BTF is enabled, the value will be correctly truncated
+  to 0xef based on the size constraints of the u8 type.
 
   **Case Two**:
 
@@ -2939,7 +2957,9 @@ option, and these limitations will be eliminated in the future:
 		RET
 
   When passing 0x2_0000_0000 to it, the return value may be recorded as
-  0x2_0000_0000 instead of 0.
+  0x2_0000_0000 instead of 0. When CONFIG_DEBUG_INFO_BTF is enabled, the
+  value will be correctly truncated to 0 based on the size constraints of
+  the int type.
 
 You can put some comments on specific functions by using
 trace_printk() For example, if you want to put a comment inside
-- 
2.53.0
