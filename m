Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373125;
	b=tXDZHjB7GIWZPQbH7PTlHxHaODtS41oXKzwX4TgVZOBiELTu885wQPWbUuV0CfJzj0E8
	 0FWPHyiYz221jeIe3HtXCER7OKv2IHrBkQHHRMFgQZ8Rj27uuWhwIynhfPnyR8R3r3Obz
	 w4vJxcE/tHT2iTFGkLjldD2t6xhTCtliLv7TJ5ebB7jBemVY30iRHTRyLoX2gnds5TrIQ
	 w8dQ4Mda9eDJ/BiOOW5spJrlWOKpoyaG3iiPIVizsuzrCx1CIkgn1XJx8AXCUVzf4EO90
	 9HFt/wOEgJ/d7sbJXu7o+bAom15oQanOKN6Z3CBDjc4aJX0NnFT84Skb/yngE6ZdBrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373125;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=;
	b=wCI0mH/OQh8KzkoXUw4/wbniuAcspN3pkm4XdEjTJUgPjyZDtLWFOXQo5S3h/RICHPu6
	 laJj4DayfvAqibDWhjFNzmRgwaLKFWTp9HpK09skM0xu9WpjOQueep6Nfmu88E8ywnfvE
	 9PRGCNXsaOPw/5UkEnmQBHDfJf87Z100ROhh8MN0bBrWW8ygUQlTNl6KLWsFk35Y38yQ4
	 6//J4hzM4WdgA7ATM8hOeSFngHG4/lCoXrlADjJPgwGnX24oIWjPI0h4Fs4aHmrq2FsZD
	 pWrv5V8sxbCUId3POZsHFfH5LMD1Os3wRhrFIJqu1LNq6Jp2Q99XFnPV8oETaiNmSLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="BO0y8/fH";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVDrzZH9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA8606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BA8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BO0y8/fH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVDrzZH9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERGIr3552480
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=; b=BO0y8/fH3gLQSh3E
	LwvuppWg9czyH21+fMKkV8oaYpToY3fS3rmoGfx2EVSSlBMfxaqRBCcxG8WMysf0
	dRVUKvZtpoTVQFJDRpwAQcFhvsnCz6oQEOpkGjSrq0Cfv/DsYEwMuBN7EqaIoWsV
	4oIdvSlkAFLXOtCs9ACPMhlB8okTuZlsjj1swpJGYZm357OQhx5HfwxpssxAfO60
	VQ5X5lpvSVe5RUyrVs1ggORrwUaDRXpM3Ld/oJbMJjGE6lG5DXoMCArPQJwnRVnm
	u27BQE83Lta0EyA9Qkzio+6p1eVaGXr00Y855YyxGPnJ6M5I3KzS5KMSdXiVoiru
	fZlHJg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkmfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:12:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8862ed0539dso742584b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373122; x=1793977922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=;
        b=QVDrzZH9R1uw3sgm2SK/VX3Y6T69neQADA0dzEEq2OWgwwittxo4DHn/COSNTtCD9e
         OA1tJtQwYFWp0nkZxEuthreN2POQMQAZl6lSh6uvcFdJL0bEIgIqeVUWltVs//KCoRcA
         9hvzoqGH236j7p+LyUAQwWa6IeEm8pc+8IYIn3Er7jMCts8Lk70gyQrL3Dzll7v57Icy
         biUcGLaurcjic2x3SclsrHtFF+z6ZCukOMAhgav7Ms7Sk/xMWulmdO+pKRE4QhsbuPPc
         gf2qYSppING4bDQvdZSLzwuhpvQiU4O22fGen50Phjg7SG+qnOxFydEUtu44n4YbtPIc
         ORDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373122; x=1793977922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqqG/ad1bjj3lH4nlT+E5iF/jT1XPQJ7R9eR64w7hVg=;
        b=aUU0aIA/qL0PhQrUY6Ql5Vclti0uVUXPHzP/obws3/u2ZfCyQkxbxn2pbu8EG961r/
         dV7fJ8mb2NQ9B/t1tNwDtDWldIPh8ZhRJqT6nVgrElq0QEDohH8Ra7PyIWHUL/ftDFkW
         laLKXWu1rWrtM8KEgkihkuUkPRwPYGU+Jfkv64h8g5oT0O0QXnOak6L6X97mQbEC5gEl
         0d+dWK1+ZqbU64fVLSEVAjC2+90kBOPRN5bFS6vkEjZqNWZdaxjbxtHUu8zTalKXT8t9
         aVOTKUj0N729Tqy4/TUKKOUtJKdOzap93OFkaFsvVFZvJuJmn6Ip6IusB1X0kbyh4LQR
         PS+w==
X-Forwarded-Encrypted: i=1; AKwUvBwTyobzjGhv0pBAUPcaaDnrEYVblIBl4dpS/y9kOh0pi3IjhBYlQhlSEB6AOvSkKUWgVPOzDiusxYcm8lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhzNy/opg+ieTOwpH8ZoAY2po1XLHA0AAN604LdN/RHWz9pPuf
	eEjHlPnbCy+n1Eg3PV+sXjmFLmF6GdZOp6bhwCXGh73Yv+eNM7MGlJhM4M9li3nz4A3viuiq9ra
	UTWUKIXX8S1SrEd8zg/uWc1hfsfrzS8ZJgV0Rbtl9kYiKejhx84gDpON57bImwJR5aJw=
X-Gm-Gg: AYBFou0YiIOjV5h3Z6hnTxqGyT5Uxz8Ba1JhD6t1ydu4DlS7/eqUFsvirc4cTqoBe1i
	+QbCsebR3+fzYW49PLaM+6f9RSuNFLbJ0I55cQ45DWXuB4GTC/K9VoR4WQ3Izicwa5TLMghe+UI
	cxiyr+ZfrZwt6lsRzo6Qz0iA2ny4EpOLCDzG28njtDMX22L1vXwtBl/fO8iINvyeitSa9wwxDZs
	WF9U4k0d5OQbYgAdKbQqGzxoc9bkEXMC1NBruUdArH+IrS9BcyFXXNRQkXWV4ycLcXhTf1GBA0x
	fA+kf+lw5YltOfy+S8O17/SDdW/WoewTqlkN5VZxBP5OZW1awNhwIJlN/AOiWBB+qLWGWUfWLeV
	YojJQUtHpau9kGy6LgF1IUe96WVrP4LDiuDCjytyHxOG4ftl9syuOpsmnbyIF0Ctj4JKVLBlwXG
	YucWtyVfD2sPQ3At4xrUH+ncb4dnAPGhIqlsw=
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr2282956b3a.10.1793373122484;
        Fri, 30 Oct 2026 08:12:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:806:b0:886:bb44:631f with SMTP id d2e1a72fcca58-8a9bb79fb0dmr2282935b3a.10.1793373121972;
        Fri, 30 Oct 2026 08:12:01 -0700 (PDT)
Received: from ?IPV6:240e:478:ea8:4f7:3946:ff2c:1750:9851? ([240e:478:ea8:4f7:3946:ff2c:1750:9851])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2dec47sm112820b3a.36.2026.10.30.08.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:12:01 -0700 (PDT)
Message-ID: <a6840be7-bd50-4e64-af1b-0ab9334d8ec7@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:11:51 +0800
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
Subject: Re: [PATCH v3] selftests: cpufreq: stop CPU hotplug loop after
 cpufreq update test
To: xiong yining <xiongyining1480@phytium.com.cn>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenbaozi@phytium.com.cn,
        zhongqiu.han@oss.qualcomm.com
References: <20261030104213.2030283-1-xiongyining1480@phytium.com.cn>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261030104213.2030283-1-xiongyining1480@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _bX8a5kCmWri_VrCyV1bhAuzweB7Oizw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MCBTYWx0ZWRfXwhe4/+D/jl6Q
 ugKDIbuqnucq0CAi4iLtNA7TDwZxnl115bKxgD4G+sU0IHE0nll0M/eioojR02/zCA75BLC3kat
 7gnqF+STfhhRBLhCPHC6b6zK/HGPsEk=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4b3c3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=Vt2AcnKqAAAA:8
 a=VwQbUJbxAAAA:8 a=fgrLqfBXAAAA:8 a=EUspDBNiAAAA:8 a=xRBUsY3wTV8rGD2bDtsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-GUID: _bX8a5kCmWri_VrCyV1bhAuzweB7Oizw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MCBTYWx0ZWRfXyXf7iLIXNmjl
 im5vdCKX3KVgg1NpYAjkrs3MdcLuFf/PAh2R1iGXVJ6e7oEGHpoYvMHOV7uth78IA0cRB8eCgzu
 Pjs7uhPTB1c/IWIlNsN9xMRMDXFDQmNxIXeZl0TObFQZ6EukFbZGgHDCJI1qUsjgYH7Y+usVb0z
 TbkqIyyK2z2wTiR0Fq85FK/QnOG2PhJM7Q+8sKHsmq8UIjKY69yqY/RmSzbsbTlAZQd83Uhc3DI
 AsUlkXS9WnY2HV7pofkuBzvBn7LG4MzM5MQLTJDjOYzqQ61KZhDSzk/fnKCNCcZl9+Sz2Trvshq
 e78KNM6mfd86ikvEpn9vL3gI3o0dJMUhNBdsCOxmu/2tLCNCudNkYjod7pSumrX06cTS7NZGT3u
 7OIT89P8mctXUyG6ng+6YFdZ7arK7Nw9r6F1rezlRGYXZ4b6D5oTHgiBEECZIVRpOUwDOKwUA2t
 FbC2/yculkbeFPBBKmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300060

On 10/30/2026 6:42 PM, xiong yining wrote:
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
> Use signal notification to terminate the infinite hotplug loop, and
> add an EXIT trap to clean up the hotplug child when this test function
> terminates abnormally.
> 
> This makes hotplug run only during cpufreq sysfs write test,
> align with test objective.
> 
> Signed-off-by: xiong yining <xiongyining1480@phytium.com.cn>

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> ---
> Changes in v3:
> - Start the hotplug child after governor switch and sysfs frequency reads,
> to avoid -EBUSY errors when the target CPU is offline.
> 
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
> index e87ed7c8e5e5..0665da8f2444 100755
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
> @@ -92,6 +94,16 @@ governor_race()
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
> @@ -101,14 +113,18 @@ hotplug_with_updates_cpu()
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
>   	for j in `seq 1 5000`
>   	do
>   		# Set all frequencies one-by-one
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
>   	save_all_governors
>   	for_each_non_boot_cpu hotplug_with_updates_cpu
> -	wait
>   	restore_all_governors
>   }


-- 
Thx and BRs,
Zhongqiu Han
