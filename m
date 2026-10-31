Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460320;
	b=FiIfWP1mFOiMS650iNOn1DlVQ5oXlhOTpKnepChKEoSCnaiX5RxST+skhSGNcvEBtB4l
	 cF/E1wVe/KKwDt5ovBAQM7AciWiD/SeiS1M36vblCQufXVIchVxeW3B0WFWcV4L+CrKnF
	 WaS+mmdu3NAtjuaDtCUdPtGTUu1OHpOGG7ZaNfv/S8sg0z1mE7yDSpOSuCHyczWNj9tbh
	 JyT5semg9wTwRcpgX2myibgB0Y/kfEuW9IHLynRfGveIJxooX5zp/8rT2Wvs0z33y08vr
	 W/z9cI7XFvZ4wQHCaW2W7+HOzfXHEYfQUeoWbkQnloGgEptqCWmPpG2ttj8RQdwdoBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460320;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=l2e+YjaNDT0bfVxmSZ5hLphcD8LhlqKCRgvRKoG42Vo=;
	b=qk4Mk7RFTjy1sbTrFE9hu+R56d6dYY88bLQU3wiTjygQES88qx/N+3t1xH9aqsOGym1V
	 L2jLIt2Z1DgzZMIseUBlftc5tj/eVgwqJq/Ge8DvgxUboTioaG0DRjypcE9oJjgpej543
	 s8D+vtICPMKFpOu3g/zcF6E+iRszF7SfetCcLQk1TRECsctHrE0p/sqG9NEiYbs4ZCHCz
	 F1aSXRY4vet4Jz6eigcUFVd3zgEeCoZBA8JH5ShSO0f67Uyt7U+Wa7eCXpSKbOeXTK0wE
	 XH2Fxd9vQp8jijueAaUiqs2n5poCNqrkvUnt8Y3/suPv2DDqF4VPr9VWLlykW10aRAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=W22S0n3J;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=c+j9h9C8;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9051606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9051606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=W22S0n3J;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=c+j9h9C8
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793460315; bh=l2e+YjaNDT0bfVxmSZ5hLph
	cD8LhlqKCRgvRKoG42Vo=; b=W22S0n3J8XH1YiSR1YEqPWmBhkhweQTY5aYDM8LOTsboj4wQH+
	0Qo5Iz/+GDyaXd9h4HaZpvER73ZYlyT2OGH+1MeL6FjKKFrUOsK6AtFJecUEko81zbwipNRG79Y
	ek7E/zhKreO5g1+fuxlS0ScU9QTcOaJ0ISa6mzCUP1NgqhI0ch0/BRnWYDFQnJz3Sabv2/uWtC+
	1Cv9/jpvaOXK3MxC5AGtil6j29UPB6R/G5YRcxaPOF0QHSVMEIwLKCyF+a03f7LwbfkNtzWiOFQ
	LlNEkeZzHNx910iYJ5Q3r3YoQUSOw5KlaRHK22oJHqTKKuPFnL5BAzrPNw0xYGp0SSg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793460315; bh=l2e+YjaNDT0bfVxmSZ5hLph
	cD8LhlqKCRgvRKoG42Vo=; b=c+j9h9C8hH1dn8S7bCVwyY6CCxfNuOadoo+a90boVkpeJGBC+3
	KctrmgTJfUVq8sWmcwCvfZ7cBC6MXTI3WUCw==;
Date: Sat, 31 Oct 2026 15:25:16 +0000
From: Bradley Morgan <brads@mainlining.org>
To: Avi <thnkslprpt@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>,
 Matteo Croce <mcroce@microsoft.com>, Petr Mladek <pmladek@suse.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reboot: validate reboot CPU against the possible mask
In-Reply-To: <CA+jvY9F9DS4SwAg=xPS-8GRee_01V5LpbCpSWdP581MOuwBz_A@mail.gmail.com>
References: <20261031060602.2949895-2-thnkslprpt@gmail.com> <D92156F5-5924-45CD-BCFE-AF385BDD15CF@mainlining.org> <CA+jvY9F9DS4SwAg=xPS-8GRee_01V5LpbCpSWdP581MOuwBz_A@mail.gmail.com>
Message-ID: <38CBE851-BDCD-41D6-8F64-0970300F0502@mainlining.org>
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

On 31 October 2026 14:58:04 GMT, Avi <thnkslprpt@gmail.com> wrote:
>Hi Bradley,
>Sure no worries - I'll check your suggestions and after I re-validate it
>I'll submit a v2.
>Regarding the patches - yes I'm working through a big list of (potential)
>bugs I had flagged from last year, but have a chance now on some holidays
>to run through them.
>I only submit things I'm confident of and have reproduced.
>I'll take your advice on board.
>Cheers,
>Avi

Please don't lie. It's not embarrassing to use AI for things...
Really it's not, anyone who embarrasses or says your wrong for using AI is
wrong in my opinion.

>
>On Sat, Oct 31, 2026 at 4:13 PM Bradley Morgan <brads@mainlining.org>
>wrote:
>
>> On 31 October 2026 06:06:03 GMT, Avi Weiss <thnkslprpt@gmail.com> wrote:
>> >reboot_setup() and cpu_store() compare the requested CPU ID against
>> >num_possible_cpus(), which is a count rather than the highest possible
>> >CPU ID. On sparse masks, this rejects valid high-numbered CPUs and
>> >accepts impossible CPU IDs.
>> >
>> >Validate the CPU ID against nr_cpu_ids and cpu_possible() instead.
>> >Reject negative parsed values before the mask lookup and update the
>> >error message to avoid assuming contiguous CPU numbering.
>> >
>> >On an arm64 QEMU guest with possible CPUs 0,2-3, reboot=s3 selected
>> >CPU 0 and sysfs rejected CPU 3 with -ERANGE. With the fix, reboot=s3
>> >selects CPU 3 and sysfs accepts it, while both interfaces reject
>> >impossible CPU 1.
>>
>> Hmm? Did you have to hack the dtb?
>>
>> >
>> >Fixes: df5b0ab3e08a ("reboot: fix overflow parsing reboot cpu number")
>> >Fixes: 2c622ed0eaa3 ("reboot: allow to specify reboot mode via sysfs")
>> >Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>> >---
>> > kernel/reboot.c | 9 ++++-----
>> > 1 file changed, 4 insertions(+), 5 deletions(-)
>> >
>> >diff --git a/kernel/reboot.c b/kernel/reboot.c
>> >index 9a84401adde5..7b09116376e3 100644
>> >--- a/kernel/reboot.c
>> >+++ b/kernel/reboot.c
>> >@@ -1146,10 +1146,9 @@ static int __init reboot_setup(char *str)
>> >                       if (isdigit(str[0])) {
>> >                               int cpu = simple_strtoul(str, NULL, 0);
>> >
>> >-                              if (cpu >= num_possible_cpus()) {
>> >-                                      pr_err("Ignoring the CPU number
>in
>> reboot= option. "
>> >-                                      "CPU %d exceeds possible cpu
>> number %d\n",
>> >-                                      cpu, num_possible_cpus());
>> >+                              if (cpu < 0 || cpu >= nr_cpu_ids ||
>> !cpu_possible(cpu)) {
>> >+                                      pr_err("Ignoring invalid CPU %d
>in
>> reboot= option\n",
>> >+                                             cpu);
>>
>> Could the parse be unsigned? simple_strtoul() returns an unsigned long,
>> the int cast cuts it down, so reboot=s4294967296 wraps to 0 on 64 bit
>> and you reboot on CPU 0 anyway. And cpu < 0 goes away too, here's a
>> something you could apply on top of Ur patch.
>>
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index 7b09116376e35..4f28f7eb21a13 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -1144,10 +1144,10 @@ static int __init reboot_setup(char *str)
>>                         str += str[1] == 'm' && str[2] == 'p' ? 3 : 1;
>>
>>                         if (isdigit(str[0])) {
>> -                               int cpu = simple_strtoul(str, NULL, 0);
>> +                               unsigned long cpu = simple_strtoul(str,
>> NULL, 0);
>>
>> -                               if (cpu < 0 || cpu >= nr_cpu_ids ||
>> !cpu_possible(cpu)) {
>> -                                       pr_err("Ignoring invalid CPU %d
>in
>> reboot= option\n",
>> +                               if (cpu >= nr_cpu_ids ||
>> !cpu_possible(cpu)) {
>> +                                       pr_err("Ignoring invalid CPU %lu
>> in reboot= option\n",
>>                                                cpu);
>>                                         break;
>>                                 }
>>
>> kstrtoul() chokes on the ,... tail, so simple_strtoul() has to stay.
>>
>> >                                       break;
>> >                               }
>> >                               reboot_cpu = cpu;
>> >@@ -1351,7 +1350,7 @@ static ssize_t cpu_store(struct kobject *kobj,
>> struct kobj_attribute *attr,
>> >       if (rc)
>> >               return rc;
>> >
>> >-      if (cpunum >= num_possible_cpus())
>> >+      if (cpunum >= nr_cpu_ids || !cpu_possible(cpunum))
>> >               return -ERANGE;
>> >
>> >       reboot_default = 0;
>>
>> One more thing, and this is the suspicious part. Youve sent 101
>> patches since july, 15 today alone, across 59 different subsystems and
>> drivers, and
>> lore has the whole run of them.
>>
>> Id reckon you'd be using a LLM to develop them, and that's fine, but
>other
>> subsystems may not like this kind of thing, so perhaps be more
>considerate
>> of others when submitting the patches?
>>
>> Perhaps Google maintainer burnout and that'll help you.
>>
>> >
>> >base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
>> >
>>
>> --- Thanks!
>>
>

--- Thanks!
