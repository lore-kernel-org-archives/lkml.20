Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198495;
	b=apnZxAab2htVThgV3A/Nx6F1HncQIrzX4VYq27yRu3FPch/SsLCMAw4jrlqAKzeaFBhJ
	 ovInczKUksABT0pvbHLSOSMVsiyGOi0r0HPmwvbeU/X7h5de1aYbNk7g6qcPKUG7CJre5
	 RobZo9uLTd+HIQQVha/0+CR152f7vNytN48hU+Hk5s2Ul8s/DaZDVx3whLfn7lYM/mehp
	 CLLXREauODpsWExs2rdXiqxb5Dwvpv7HU5jpqHkQiHDTByY93sMZ3h8C4RD69NDSoFA/N
	 M0SRjm9DArJzKAXywxWrLQ40jEHSZK5Up9wgTPbrZtmIU/jV3Z0wHrOCLb8wUGTknDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=;
	b=Ud3b3+VICalMvHDVj0SO5enec2TJ/GQxxWnjuY8Extd3K4a83WiS1GlNQS4Usxs7myav
	 aJ5AS0calry2M547PX67ZQ5RBV4ewiXXwpl3B0Um/iJ57XI1hwXO03NO94HpKamIOowMV
	 /e5Y9kPRz6SRxRHT77OlTVvZPD05EK4ZP6eIY4OCUzd41UR/hvSbdcuoZdjGJWRgw2Z2R
	 QxT8mSqTWz4vFIsfLyqo0HX51DigfMzLA4zvwZKuqbVS1jucwDBH8QdpScdLY1uzqCv/A
	 7Np/6EMTZ1rHWDUlYb2kH31N9nvYOe6DNrKy50ZVa9sFda5xQg1NZqCJL7+QlQpwlvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK6P9sRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE2iqtn4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30A606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C30A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK6P9sRl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dE2iqtn4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDI5pX718077
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=; b=QK6P9sRlLQRXw6DN
	5y8otHdGrG0lxl0Y26kfdeAF0hp4rr10saNLUaBdlF4GUhI3ELvHc4HAnnpF6hnz
	msyjQAT5ZSqRqyADyOQolglwcbUU0614GTZDpLbZAaWs849h+4+EvfUV+2usdeDm
	m93j32xYU8ZpK2tOOaZDCgGbkkfXUiiaCLDqdRR5tkAFfyxC9buM5dU0SzVtNU8B
	IVxhnfWAvRDfqer7AgM+0Sl1RqTbGYKnZmCNJMj8K/fdj1TTE04G8g/MxH7eUZ9F
	nJwr+XtE1K7FI3kX/LVcI2OAvZmaABsu8lCpO4TI5M7xxUBO7SQjZBlJiBMfJwJr
	MaKsXw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgbrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:41:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso898797a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198493; x=1793803293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=;
        b=dE2iqtn4jyxZogmzG6xMCFssuZNzBJCTBOFSvjRZkIFS0mOC3kVBKzrljCoC+SQpR2
         eDwRi70oNzQS7iYq9Upyh1ohmaiQ5E4853fcqgvrNRlOOInk9DLPcdXGx8werPWgIg1/
         Ej6SoTdNezQeZ3QsYoy06BJuQU/zYO3ag5iQcdXtiTCuwPPfA3oz5BFQVw87AtwEq26K
         0zzI+Hr9IpOOZ40/bntcI/t0tvn46d0OgTwNwlt8FLSMS0af4Y2FpMsLFZH8NdQ53ZXt
         ZUgcXj37/jiS8eLyvylpRaTOcWVAEPbjA0ALgirgLHtJvZSX8cA1y+zP3+5KKixHYtOd
         kDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198493; x=1793803293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cU+ZB9844KPXAcjrEqi/T/TxmCtfMJe4KVaRRxeF4PI=;
        b=V8cNCPwkkABp2QFy/3RjdY+WyUPKqMKaWS9HuC3BnW5fXimGCZ7sx72ZVK118h42Ep
         7KlqodtucDZYbVvO2cR9BGpZJ3FPiSgbMXbjA+m4p4YJYQK9YMbatP4VP1Ek/I8AlgNI
         IZwWXP0DI1DqQv7vlbqgr/kGsQe3liWw4K3k/3ZHJgUJTfNMJBYAqE75FIqBnm0WYAU4
         XyeLlNFEwe4hGXWxlb0nGYDiuKhcj2KdwxmCf+mjAFoNHPQvhhMriSkqZEDr2CL7YeFS
         iMzALaCb6iOxqJE8hrOZO7EIGs4+tZLsLzVeRmAiVLL9Gny0o5Xy95BeETe6u4UZGvwd
         QIgw==
X-Forwarded-Encrypted: i=1; AKwUvBzmz3C8pR2MFaUfLrpe2PMIh+XQXQQHOtRMiKF6FdAaib3HuK6khoohcWUA72axtlawPjkUtCtKNxwKyMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZJ4Wxtu3vAGCjB87g0TiZuOTyX3oXzJdt8WpGLIxjKmOsqGVM
	NN8mjnqeA+ttkAQxjpu88P2jtIgVE6PwFbJJkawxLLF61xwu9zfPBHeHTYuWGlW8rc+Po5uaRY9
	qhyiJzz1w/lAkqrhR1FoQf8WudXkv+0UADymbreHIGZgSwWw5NNiLhH3bhVvQ9ntFk1s=
X-Gm-Gg: AYBFou0p9O/xwJVbkOoyE+9PmFnl2Q5iKnshFLwNgQQKs+JIoBqE4W1sjdi/pGrN1uN
	XCPMztfmUcNvFB1pDbTsDqLWKSJBz7B/OXVpMX2bkGJ0UKiweh85EHiDfQFqrlwiguIMMjxMRqf
	cpolnz34Ywu+f/doM2IAH/PVHZAk7hVpvb9lpaRLBivSNYSH6RsZwfZ1Tc7L3mYOtuNbU3tpHk5
	eJSkcWjRrXhBwTVkmS5DKHH8BOyz8ptMqMeXBWLP9lxyvfkPRT8WjgIsghGw/ia8iLbUbgPmP5J
	ck3qDclyg32vUby7TD8eL4zmr2Ny8vIjKvggiEKgvOW3WuY8wE/bApnksTRS+FgS/OBIpGsBwP7
	ZHnjJV1jCVM+EySslie0BjgFnMKok4Zg43THSz5QzYbP8tV3v9YAuTMa1Q0g1H19Qgz6aMzOaaB
	gCC+lTiogPTiZf+UCwqtgcLgh83JH6SpOZGsKU8qkPt9vz
X-Received: by 2002:a17:90b:2296:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ae57e2b787mr1494817a91.9.1793198493238;
        Wed, 28 Oct 2026 07:41:33 -0700 (PDT)
X-Received: by 2002:a17:90b:2296:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ae57e2b787mr1494800a91.9.1793198492549;
        Wed, 28 Oct 2026 07:41:32 -0700 (PDT)
Received: from [10.133.33.238] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5839besm3357980a91.11.2026.10.28.07.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:41:32 -0700 (PDT)
Message-ID: <b228d3c3-ac4b-43df-8829-edb9c459860d@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:41:28 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: cpufreq: stop CPU hotplug loop after
 cpufreq update test
To: xiong yining <xiongyining1480@phytium.com.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenbaozi@phytium.com.cn,
        zhongqiu.han@oss.qualcomm.com
References: <20261028100241.189085-1-xiongyining1480@phytium.com.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261028100241.189085-1-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX2tpAbcxCXUC1
 w09T/M+4jgFjOXrQfXoMq/bu3xUpdnP6L3h7F/lc7VGm/L7/xnrdmyNpIMnkIyHoTyKPeIIXK7y
 r0rv4y2MEtaD87qAkzaeMMuf7xJkgahQwD0dwvQMcN2fOCw/oMEEpiC5IfsOAyKR+M5pTajupVH
 zX+O6IDKqR0sjOeu7oGamSN71G97+Rc/ArCKSu9ZrAXSe4sF0S0J/f/KzxBY6mxhdGn5s4jRVgK
 95Xc/tKv8WKgcJnQoLanQWu7DtULtmjJ7bbul+4jlY64ToxPJ7vUey3KbwBB0owkrujYLQ+Sgot
 wn/+ZO5I9RHbh3jMUeITsx8V4vNuAPvGXpCS2xOZ06QBK/0lg1xiyfu7dOEeqEwuNIYgts5EAg5
 ljfiw4+4VuH/vTLOJTPS9g/E0Hmx2hcEmVkt0L3KwbPCCd1C6ufZS34G9kMjCescWkoKzFneMfN
 Y3zIP7TCWn6KHDDHI8A==
X-Proofpoint-GUID: yJ7Xr6E_Nw9oPKzWIC08Jrbez2I7HKTt
X-Proofpoint-ORIG-GUID: yJ7Xr6E_Nw9oPKzWIC08Jrbez2I7HKTt
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2099e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Vt2AcnKqAAAA:8 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=fgrLqfBXAAAA:8
 a=rLnwe5TcSjkNIz7vCUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=v10HlyRyNeVhbzM4Lqgd:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX8Il0KvTw0paC
 oR+35oqh5+rOOgL1JqJ9ypxLTeLgtTrmq8PmrLHoHIg19z5rAAn+KKQxKUFFdMAsaTT1kYR3WG8
 gI7/EhDdBR2yRdrhtcZa2kGdHsFckCk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

Hi,

On 10/28/2026 6:02 PM, xiong yining wrote:
> Original test uses a fixed 5000 iteration loop to trigger CPU hotplug
> for verifying cpufreq synchronization between CPU hotplug and sysfs
> writes.
> 
> Two issues exist:
> 1. Background hotplug task keeps running after test completes, causing
> redundant CPU on/offline operations.
> 2. When cpufreq frequency setup is slow, the hotplug loop may exit
> before frequency updates finish, which breaks test purpose.
> 
> Introduce a file-based stop flag to control the infinite hotplug loop.
> After all cpufreq updates complete, create the stop flag file and
> wait for the hotplug task to exit.

The changelog still describes the v1 stop-file approach; please
update it.

> 
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
> 
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>
> ---
> Changes in v2:
> - Stop the hotplug child process by signal notification instead of
> a stop file, avoiding the predictable temporary path.
> - Add an exit trap so the hotplug child is also cleaned up when the
> main shell terminates abnormally.
> - Link to v1:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2662696.html
> 
> This addresses the security and robustness concerns raised by Sashiko.
> ---
>   .../selftests/cpufreq/special-tests.sh        | 30 +++++++++++++++----
>   1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/cpufreq/special-tests.sh b/tools/testing/selftests/cpufreq/special-tests.sh
> index e87ed7c8e5e5..b3ebead1c52a 100755
> --- a/tools/testing/selftests/cpufreq/special-tests.sh
> +++ b/tools/testing/selftests/cpufreq/special-tests.sh
> @@ -16,6 +16,8 @@ source cpu.sh
>   source cpufreq.sh
>   source governor.sh
>   
> +HOTPLUG_PID=""
> +
>   # Test 1
>   # $1: policy
>   __simple_lockdep()
> @@ -92,20 +94,34 @@ governor_race()
>   	restore_all_governors
>   }
>   
> +hotplug_cleanup()
> +{
> +	if [[ -n "$HOTPLUG_PID" ]]; then
> +		kill -s SIGTERM "$HOTPLUG_PID"
> +		wait "$HOTPLUG_PID"
> +
> +		HOTPLUG_PID=""
> +	fi
> +}
> +
>   # Test 4
>   # $1: cpu
>   hotplug_with_updates_cpu()
>   {
>   	local filepath="$CPUROOT/$1/cpufreq"
>   
> +	(
> +		local quit=0
> +		trap 'quit=1' SIGTERM
> +		while [ "$quit" -eq 0 ]; do
> +			reboot_cpu "$1"
> +		done
> +	) &
> +	HOTPLUG_PID=$!
> +
>   	# switch to ondemand
>   	__switch_governor_for_cpu $1 "ondemand"
>   
> -	for i in `seq 1 5000`
> -	do
> -		reboot_cpu $1
> -	done &
> -
>   	local freqs=$(cat $filepath/scaling_available_frequencies)
>   	local oldfreq=$(cat $filepath/scaling_min_freq)


The background hotplug loop is now started before switching to ondemand
and before reading scaling_available_frequencies / scaling_min_freq. If
the CPU happens to be offline at that point (such as single-CPU policy),
those accesses return -EBUSY: the governor switch is lost, freqs is
empty so the update loop does nothing while the test still passes, and
oldfreq is empty so scaling_min_freq is not restored. Please start the
hotplug subshell only after that setup is done.

>   
> @@ -117,14 +133,16 @@ hotplug_with_updates_cpu()
>   		done
>   	done
>   
> +	hotplug_cleanup
> +
>   	# restore old freq
>   	echo $oldfreq > $filepath/scaling_min_freq
>   }
>   
>   hotplug_with_updates()
>   {
> +	trap 'hotplug_cleanup' EXIT


AFAIK, regarding the EXIT-trap-on-signal remark from Sashiko:

https://sashiko.dev/#/patchset/20261028100241.189085-1-xiongyining1480%40phytium.com.cn

Bash runs the EXIT trap on SIGINT, SIGTERM, and SIGHUP, so I don't think
additional traps are necessary. This issue occurs with Dash, but not
with Bash.

One sample simulation script：


#!/bin/bash

for sh in bash dash; do
	command -v $sh >/dev/null || continue
	for s in INT TERM HUP; do
		out=$(env --default-signal=INT $sh -c \
			'echo "$(readlink /proc/$$/exe)"
			 trap "echo EXIT-trap-ran" EXIT
			 kill -'$s' $$
			 sleep 1
			 echo not-killed' 2>/dev/null)
		rc=$?
		self=$(echo "$out" | sed -n 1p)
		res=$(echo "$out" | sed -n 2p)
		printf "%-14s %-4s rc=%-3s %s\n" "$self" $s $rc "${res:-<EXIT trap NOT 
run>}"
	done
done


output:
/usr/bin/bash  INT  rc=130 EXIT-trap-ran
/usr/bin/bash  TERM rc=143 EXIT-trap-ran
/usr/bin/bash  HUP  rc=129 EXIT-trap-ran
/usr/bin/dash  INT  rc=130 <EXIT trap NOT run>
/usr/bin/dash  TERM rc=143 <EXIT trap NOT run>
/usr/bin/dash  HUP  rc=129 <EXIT trap NOT run>


>   	save_all_governors
>   	for_each_non_boot_cpu hotplug_with_updates_cpu
> -	wait
>   	restore_all_governors
>   }


-- 
Thx and BRs,
Zhongqiu Han
