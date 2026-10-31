Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456024;
	b=0mB+uXpSEzi9rl4Cic7dRs3dGgk6sTghideVJy5HiKHciSipbvahbFOXXrdqolylOmga
	 owmy4yEttL2qPTb6fxpFLlAKMdZDnzJWWrPYV1Cgpix54cXOeYRhjcTM3vvXrm7Z8FbGi
	 Q3+vgceuXhFnosIOk24IR0XzVHDHbQk2McnBRoxYM/Ll43ctgKGbN0TzLzKq/W1Dyx5QC
	 MQohxIsFUu2bl7CHED5dvm43f8audwEan9yTRZySOI0tjjIu0FrhY2tB1cucp+nqeikz4
	 nogLVE63eCWJiQb9bPlSIe+O8Xfi2qqeHvF3BSJARbNSA/rsDnmpMkVEbWs+kG4R3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456024;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uyTE8za6xgZ/kVyYuhK18SnvVH/R5XyWDj9xxlAduJY=;
	b=g6ABqW38VeM1+fH9vNtFiE3pB7Z+F7Rt87jJTialmrktdr+niaxJxAT50cNxSYmGxMTW
	 tTCpnFShRWjYifUy0b5VX9JIuWsOP/IlbLFYo+b8ubUrkjAmsJgiaqrbEfESJLJLyTFJY
	 ic6kyz+M7II+SQeMLTtFhctAhpCIQ2Ve3d9jLJksnqKmqtcaML66i39dv8wqR2qz/Ywz2
	 p/4E63v12F7U/y6IBV3gGRDUE3exFkvTPU/+v5j2xsjGHP36C7SumHg3w56HmL7PQYPxr
	 M6k/I6FsLCbOkmtc2vQBhymJc7Ync0Pc9Toy/UvFu+xkTVQ8OZhIcj63ajmFHyYb2ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=QqzoYPuW;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b="3wd1U/K4";
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C999606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C999606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=QqzoYPuW;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=3wd1U/K4
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793456009; bh=uyTE8za6xgZ/kVyYuhK18Sn
	vVH/R5XyWDj9xxlAduJY=; b=QqzoYPuW2tDJdZsoCat2p/UEe8Tc/yOWy39Hx8ojtpsgvjJyUz
	E4DWFPJ//8yxMtMUVoO8xBECQVZ6qlmEyUaSEkPbV5GOXaLcAknbxYLwAg5GNwjSDWo8xONc70y
	Mt0EYdrCA9Yb86Suu2sLMBxGVT8fbNCVCwZlsYRSripOxwvufMNmrQREVahMgLQK7BM/055r/JI
	MEI0f4xmItHXvoD9F5DisXkUgiGT0zp4qhnCm7A4SQvXDfgMU2sYUGhuVdi5+GJmPOmQGkKyIaN
	skjDWowCwEiI4S2NMrbFcZEZ60MbxcUJJxhaJ4+va2CLkpVWjtUIC56HnNiWTt8AFiw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793456009; bh=uyTE8za6xgZ/kVyYuhK18Sn
	vVH/R5XyWDj9xxlAduJY=; b=3wd1U/K43CMHmuJSqu/bfx/qfgNyd2d/uChSFy92ZdkaDE2Qtk
	aGf0xWrLOcZUaBsGSSwe6kSUtDtV9FWwY1BA==;
Date: Sat, 31 Oct 2026 14:13:29 +0000
From: Bradley Morgan <brads@mainlining.org>
To: Avi Weiss <thnkslprpt@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
CC: Matteo Croce <mcroce@microsoft.com>, Petr Mladek <pmladek@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reboot: validate reboot CPU against the possible mask
In-Reply-To: <20261031060602.2949895-2-thnkslprpt@gmail.com>
References: <20261031060602.2949895-2-thnkslprpt@gmail.com>
Message-ID: <D92156F5-5924-45CD-BCFE-AF385BDD15CF@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 31 October 2026 06:06:03 GMT, Avi Weiss <thnkslprpt@gmail.com> wrote:
>reboot_setup() and cpu_store() compare the requested CPU ID against
>num_possible_cpus(), which is a count rather than the highest possible
>CPU ID. On sparse masks, this rejects valid high-numbered CPUs and
>accepts impossible CPU IDs.
>
>Validate the CPU ID against nr_cpu_ids and cpu_possible() instead.
>Reject negative parsed values before the mask lookup and update the
>error message to avoid assuming contiguous CPU numbering.
>
>On an arm64 QEMU guest with possible CPUs 0,2-3, reboot=s3 selected
>CPU 0 and sysfs rejected CPU 3 with -ERANGE. With the fix, reboot=s3
>selects CPU 3 and sysfs accepts it, while both interfaces reject
>impossible CPU 1.

Hmm? Did you have to hack the dtb?

>
>Fixes: df5b0ab3e08a ("reboot: fix overflow parsing reboot cpu number")
>Fixes: 2c622ed0eaa3 ("reboot: allow to specify reboot mode via sysfs")
>Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>---
> kernel/reboot.c | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)
>
>diff --git a/kernel/reboot.c b/kernel/reboot.c
>index 9a84401adde5..7b09116376e3 100644
>--- a/kernel/reboot.c
>+++ b/kernel/reboot.c
>@@ -1146,10 +1146,9 @@ static int __init reboot_setup(char *str)
> 			if (isdigit(str[0])) {
> 				int cpu = simple_strtoul(str, NULL, 0);
> 
>-				if (cpu >= num_possible_cpus()) {
>-					pr_err("Ignoring the CPU number in reboot= option. "
>-					"CPU %d exceeds possible cpu number %d\n",
>-					cpu, num_possible_cpus());
>+				if (cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
>+					pr_err("Ignoring invalid CPU %d in reboot= option\n",
>+					       cpu);

Could the parse be unsigned? simple_strtoul() returns an unsigned long,
the int cast cuts it down, so reboot=s4294967296 wraps to 0 on 64 bit
and you reboot on CPU 0 anyway. And cpu < 0 goes away too, here's a
something you could apply on top of Ur patch.

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 7b09116376e35..4f28f7eb21a13 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -1144,10 +1144,10 @@ static int __init reboot_setup(char *str)
 			str += str[1] == 'm' && str[2] == 'p' ? 3 : 1;
 
 			if (isdigit(str[0])) {
-				int cpu = simple_strtoul(str, NULL, 0);
+				unsigned long cpu = simple_strtoul(str, NULL, 0);
 
-				if (cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
-					pr_err("Ignoring invalid CPU %d in reboot= option\n",
+				if (cpu >= nr_cpu_ids || !cpu_possible(cpu)) {
+					pr_err("Ignoring invalid CPU %lu in reboot= option\n",
 					       cpu);
 					break;
 				}

kstrtoul() chokes on the ,... tail, so simple_strtoul() has to stay.

> 					break;
> 				}
> 				reboot_cpu = cpu;
>@@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
> 	if (rc)
> 		return rc;
> 
>-	if (cpunum >= num_possible_cpus())
>+	if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))
> 		return -ERANGE;
> 
> 	reboot_default = 0;

One more thing, and this is the suspicious part. Youve sent 101
patches since july, 15 today alone, across 59 different subsystems and
drivers, and
lore has the whole run of them. 

Id reckon you'd be using a LLM to develop them, and that's fine, but other
subsystems may not like this kind of thing, so perhaps be more considerate
of others when submitting the patches?

Perhaps Google maintainer burnout and that'll help you.

>
>base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
>

--- Thanks!
