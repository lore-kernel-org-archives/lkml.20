Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260413;
	b=N8/sE0G8L3LDkDzNuCq5SzwL2V4O/Ssfnu3arblvEl9gfbJGsEGI6E4PEMswMU1wgfxE
	 mfCUM7ARvPd0CQaPiVP8yW82KOQeUya3A4CsUonsf9OtNMJfS6yYO3dQDGxXlSUBbfFUV
	 VcR+cns4KAaVWxjewTbd3XjynaX2b4mpd9gEZ3oNoeax1Xpo7mVzuQAuG2jhpNbBSjFml
	 SDOEnLZk3FQOgLtzdv+BI4BfkrhoJv/0CQbYEwWcerhC93bReMhAJackWr45QES+GgPx/
	 doQr4g4dnZpzSjEsuwi7FOe/Ag2k6jX2CrjeqzJmy7dWBQO69TJOtYf7/MS2I1pxbig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260413;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=eUnUJ6fMsa+SK3hUNyUAZu2gmdqYdOP/pDefbHCAe7Q=;
	b=Ndg8HVlpBMzAAcbYGh90bipkQbT2PbqqtF1EVmkqo6PyYhl/9yOVPCafgC81KO3azctK
	 rIhvxE6vQKdYGJgc7tHRTT3pH130XfASRwzsReQ9gNMh3kZYBXcNLZk6+49LJLw6HuXCQ
	 j5JYc4k1yqX9/RKwo5D/LXgfQpoXa3/uH9QWoQM0lKYkzJR1pEr0X+UMAT5RAvLFrYW4D
	 UI0qQ5TY6SxYIj1fXlJ7HUBDZw8tjDagjhSeC348u60tGc9LeJ5nLFH1Og1la2CJHM4Ph
	 1nh4eYbbLbzBX911XXmucFY3cQXeCa72kmGs/VBGL5qdl5RTCr8r7hgiMbNb4aC01oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=l1KYVv5K;
	arc=none smtp.remote-ip=91.218.175.65
Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2016C606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2016C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=l1KYVv5K
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Y3CmxKJ4TKlJACzMuZuQE+pA/o7Ia4zpMq+sD48qZJQ=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794260408; v=1; x=1794865208;
 b=l1KYVv5KTKvcHOjwvN3W7JsS0pOm5zqUWVadjvc/DlH+SplFrv95reXJBAayASZyCi9NslyX
 e//S9+Ts3oSM9uA5pZw8YVDwgQUEmSc0hmf4Tca8jGoLuPaoNkCngN1oDa6v5owBoAYUu+CasNT
 UIiN+w0KU5PpLGpGie8ld8QUVv1LF9g92QF1NRjBJP4hswLgHJHOninV/Gz1nP277uoVCqDBYfV
 lvBqNin+K1SzQI10eTy5oYfs7l5Jo+qeamCRbRD1yBlMcyDOPyupL5QxY1nDCvNR0w2Wkejtx5N
 76OsAiANQRJJ/JOH1EV5FI8k1a8wbscKKD8KcA8W4qDGA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 91629022a1c960c4;
	Mon, 09 Nov 2026 21:40:06 +0000
X-Mizu-Trace-ID: 91629022a1c960c4
X-Migadu-Flow: FLOW_OUT
Message-ID: <25204208-5fcc-4b00-b359-86fc5f124700@packett.cool>
Date: Mon, 9 Nov 2026 18:40:00 -0300
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Request stop before tearing down
 GLINK and SMD
To: Jure Rebernik <jure.rebernik@luxonis.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: konrad.dybcio@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261109175752.793130-1-jure.rebernik@luxonis.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261109175752.793130-1-jure.rebernik@luxonis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/9/26 2:57 PM, Jure Rebernik wrote:
> A crash of the ADSP that the host reports, for example through the
> remoteproc debugfs crash file, can reset the whole SoC on QCS8550
> instead of restarting the ADSP. The reset was most frequent shortly
> after the ADSP had started: on two QCS8550-based boards, crashing it
> about 4.5 seconds after it was started reset the SoC in 19 of 42
> tries. The serial console showed that the system stopped right after
> the recovery started. Nothing more was logged, and the SoC was reset 6
> to 7 seconds later.

I've been seeing crashes in sensorspd like

qcom_q6v5_pas 3700000.remoteproc: fatal error received: 
EX:kernel:0x1:SNS_SEE_I_0:0x10000025:PC=0xf00280b8:LR=0xf001f>

on a Kodiak device (sm7325-motorola-dubai) also cause a whole-SoC reset 
right after logging that, when trying to restart the ADSP.

Those are somewhat random and not too frequent, like once every couple days.

I'll test this patch and see if I no longer end up with my phone 
randomly showing the u-boot menu when I pull it out of my pocket :D

> Since commit 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if
> crash is triggered host-side"), qcom_q6v5_request_stop() also sets the
> SMP2P stop bit for a crash that the host reports, so that the firmware
> takes part in its shutdown. The stop is requested from qcom_pas_stop(),
> which rproc_stop() calls only after all subdevices have stopped. By
> then the GLINK and SMD edges to the DSP have been unregistered and
> their client devices, such as FastRPC, torn down. On QCS8550 the ADSP
> firmware treats the stop bit as a fatal error and runs its error
> handler after these links have gone away.
>
> Add a subdevice whose .stop callback requests the stop, and add it
> before sysmon. Subdevices stop in the reverse order of addition, so the
> callback runs after the SSR BEFORE_SHUTDOWN notification and
> sysmon_stop(), and before SMD and GLINK are torn down. The firmware
> then handles the stop request while its GLINK and SMD edges are still
> registered. qcom_q6v5_request_stop() still skips the request when
> sysmon got a shutdown ack, or when the firmware reported the crash
> itself and the fatal or watchdog interrupt has cleared the running
> flag. It also clears the running flag, so the call in qcom_pas_stop()
> now only sends a request when the subdevices were not started.
>
> With this change, none of 104 host-reported crashes on the same boards
> reset the SoC: 40 ADSP crashes at 4.5 seconds, 20 at 4 to 15 seconds,
> 20 while the ADSP was streaming IMU sensor data and 24 CDSP crashes.
> The ADSP or CDSP restarted each time.
>
> The problem was found, and this change was written and tested, with
> the help of an AI coding assistant (Claude Code, by Anthropic). I
> reviewed the change and the test results.
Try not to provide the free advertisement right in the commit msg btw, 
and to make it sliiightly less verbose.
> [..]
> +	 * Subdevices stop in the reverse order of addition. Request the stop
> +	 * after sysmon has asked for a graceful shutdown and before smd and
> +	 * glink are torn down.
> +	 */
> +	pas->stop_subdev.stop = qcom_pas_stop_subdev;
> +	rproc_add_subdev(rproc, &pas->stop_subdev);
> +
> [..]

It looks a bit funny that "stop is a device" but well, it's not like I 
can think of a more elegant solution…


Thanks,
~val

