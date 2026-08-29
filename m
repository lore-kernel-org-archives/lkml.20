Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC61347BD4;
	Sat, 29 Aug 2026 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994995; cv=none; b=R/1qDF+KiTtfUXfmnBT9bZF3uq9r/p+dk4duvxEuVmsDHCcqU5P+G5R8kdTr5uYZvPvjeukR7N2FW5Nm+ZrAkPL+dnx/0gsPsnYeJ7tpYuUNO21QL2/Ocb9sAoE4tUg0Wn7f0b+6Nv4AvHrnWWaqLkU22sde3B75yreQWxK0F8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994995; c=relaxed/simple;
	bh=rbtIPicIse43PXViK0lsq4wxFJ+k3tqd28YHzLi7rxY=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=YhZqOrIGm0Y0YBplL7sp8r+lf/IcJso8hIynAP73qFSJosN3+/4D9s5dDV/dzkW87L8BOB4ILSbOmQp4Zwifya0Q9cxNMXIEfuC/wS5MtkijPZ93q73vsIvynCV9jbht2aPFlqSocyFsPT9sRAyoyqyLe8O8nQqpQa5FxrzivhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hX8l44WTbz5B102;
	Sat, 29 Aug 2026 17:16:32 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 67T9GPwV048616;
	Sat, 29 Aug 2026 17:16:25 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 29 Aug 2026 17:16:27 +0800 (CST)
X-Zmail-TransId: 2afa6a92a36b378-b3919
X-Mailer: Zmail v1.0
Message-ID: <20260829171627850-M-fO58GBmrYbXIVRmVmI@zte.com.cn>
In-Reply-To: <20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn>
References: 20260829171238191s9SIXoZPTlZSmA2Px30hn@zte.com.cn
Date: Sat, 29 Aug 2026 17:16:27 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <thomas.weissschuh@linutronix.de>,
        <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHY1IDQvNF0gdG9vbHMvYWNjb3VudGluZzogc2ltcGxpZnkgMzItYml0IHRpbWVfdCBvdmVyZmxvdyBjaGVjayBpbiBmb3JtYXRfdGltZXNwZWMoKQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 67T9GPwV048616
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 29 Aug 2026 17:16:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A92A370.000/4hX8l44WTbz5B102

From: Wang Yaxin <wang.yaxin@zte.com.cn>

Replace the Y2038 overflow guard in format_timespec() with a direct
narrowing truncation check ((long long)time_sec != ts->tv_sec), which
is both simpler and more robust across platforms. Also move the
time_sec assignment earlier to avoid duplication.

Add nla_len < NLA_HDRLEN sanity checks in the netlink attribute
parsing loops in getdelays.c and delaytop.c to prevent integer
underflow in NLA_PAYLOAD() on malformed responses.

While at it, fix a minor alignment issue in delaytop.c by adding a
leading space to the output format string.

Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>
Acked-by: Xu Xin <xu.xin16@zte.com.cn>
---
 tools/accounting/delaytop.c        |  6 +++++-
 tools/accounting/format_timespec.c | 12 +++++-------
 tools/accounting/getdelays.c       |  4 ++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/tools/accounting/delaytop.c b/tools/accounting/delaytop.c
index 527266d28d9a..4e4c35fabbab 100644
--- a/tools/accounting/delaytop.c
+++ b/tools/accounting/delaytop.c
@@ -728,10 +728,14 @@ static void fetch_and_fill_task_info(int pid, const char *comm)
 	nl_len = GENLMSG_PAYLOAD(&resp.n);
 	na = (struct nlattr *) GENLMSG_DATA(&resp);
 	while (nl_len > 0) {
+		if (na->nla_len < NLA_HDRLEN)
+			break;
 		if (na->nla_type == TASKSTATS_TYPE_AGGR_PID) {
 			nested = (struct nlattr *) NLA_DATA(na);
 			nested_len = NLA_PAYLOAD(na->nla_len);
 			while (nested_len > 0) {
+				if (nested->nla_len < NLA_HDRLEN)
+					break;
 				if (nested->nla_type == TASKSTATS_TYPE_STATS) {
 					size_t payload_len = NLA_PAYLOAD(nested->nla_len);

@@ -1099,7 +1103,7 @@ static void display_results(int psi_ret)
 			get_field_delay_values(&tasks[i], cfg.type_field, &avg_ms,
 					&max_ms, &max_ts);

-			suc &= BOOL_FPRINT(out, "%12.2f %12.2f %20s\n",
+			suc &= BOOL_FPRINT(out, " %12.2f %12.2f %20s\n",
 				avg_ms, max_ms, format_timespec(&max_ts));
 		} else if (cfg.display_mode == MODE_MEMVERBOSE) {
 			suc &= BOOL_FPRINT(out, DELAY_FMT_MEMVERBOSE,
diff --git a/tools/accounting/format_timespec.c b/tools/accounting/format_timespec.c
index 1dba50cac895..d7bfd307c00b 100644
--- a/tools/accounting/format_timespec.c
+++ b/tools/accounting/format_timespec.c
@@ -14,22 +14,20 @@ const char *format_timespec(const struct __kernel_timespec *ts)
 {
 	static char buffer[32];
 	struct tm tm_info;
-	time_t time_sec;
+	time_t time_sec = ts->tv_sec;

 	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
 		return "N/A";

 	/*
 	 * On 32-bit platforms time_t is 32-bit and cannot represent
-	 * dates beyond Y2038.  The kernel timestamp is always 64-bit,
-	 * so reject values that would overflow.
+	 * timestamps outside [INT32_MIN, INT32_MAX].  A 64-bit kernel
+	 * timestamp that does not survive the narrowing truncation is
+	 * rejected to avoid silent data corruption.
 	 */
-	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
-	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
+	if ((long long)time_sec != ts->tv_sec)
 		return "N/A";

-	time_sec = ts->tv_sec;
-
 	if (!localtime_r(&time_sec, &tm_info))
 		return "N/A";

diff --git a/tools/accounting/getdelays.c b/tools/accounting/getdelays.c
index 7b1ae4492a77..688506d5cecb 100644
--- a/tools/accounting/getdelays.c
+++ b/tools/accounting/getdelays.c
@@ -659,6 +659,8 @@ int main(int argc, char *argv[])
 		na = (struct nlattr *) GENLMSG_DATA(&msg);
 		len = 0;
 		while (len < rep_len) {
+			if (na->nla_len < NLA_HDRLEN)
+				break;
 			len += NLA_ALIGN(na->nla_len);
 			switch (na->nla_type) {
 			case TASKSTATS_TYPE_AGGR_TGID:
@@ -669,6 +671,8 @@ int main(int argc, char *argv[])
 				/* For nested attributes, na follows */
 				na = (struct nlattr *) NLA_DATA(na);
 				while (len2 < aggr_len) {
+					if (na->nla_len < NLA_HDRLEN)
+						break;
 					switch (na->nla_type) {
 					case TASKSTATS_TYPE_PID:
 						rtid = *(int *) NLA_DATA(na);
-- 
2.25.1
