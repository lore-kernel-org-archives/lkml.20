Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED746EC7A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795049; cv=none; b=FWWaPCEWO4D6R54f6GqLmObCqutArO5pyLe74L2YAAYBJJdwwasYHVhsySEzolPIqpXwKld+txc5YqgyBrZ/2klm6JatHn4I14+sOxJFVYJPIt3vr+5NFM842UQE1mPGeB7amgDg+vTX7CEl5rxAx20PNIdUaw2/fP0LrlVs46U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795049; c=relaxed/simple;
	bh=KSXKge8lF98WBnWGNkG0IboR9V4b1N6GQ5xQBRhqa94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaAtv+kbSALpY7rrX2hGQrGljuNNFcOOGI3vH27Qa9hoDWKFOnYGqVzdhmxDmE2Ymb32klEjC9u19vFnjkdZRM0hmXbOdPnDyDpl9r7holULPmFN36fqCwlQzvE74sW4RiE8ChJaTX9I7yW/toImIPG0sHrKyFfJrUwkPGvIsbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kv/kH/CM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kv/kH/CM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b0584ad71so810245f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791795046; x=1792399846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VauPgqsnl4i0EoTG9j7fG+t1lHBl9BTOH+qyhzX/v4Q=;
        b=Kv/kH/CMtEBpQSNzowJAxdiRdDUII+enh3tp97T+mF4CgHNxukqpE9YqTHMuVNBUL5
         P7TA7a54P4/CMKLfy+vNojsTgONW+C4uQzROe1ddmth9Gej1xRrXWEQ0PHzntI41oALV
         R0ysgUIlDdDWhzdoyh75VMghmG48mIXzMuezPM12iOVQDxjwUFLb41PuHo43qwibQX34
         fUpgFSDHCPMwxOMEaOdSWHde+GjngsGUwKPO2VVLwloYgAA1hD8ew5Crhd6T+luVfaGi
         aqXcpK67YfHVLapBxNSNe/xtPKfooM+EjdSmNCU80HlTBp/JjI0ECjpLHXdSdsGmc9Ob
         8hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795046; x=1792399846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VauPgqsnl4i0EoTG9j7fG+t1lHBl9BTOH+qyhzX/v4Q=;
        b=bE4GhgBJpq+Navv+Sto6BWqlMp169cztmz8igh4IFgB8GNmGqL5In6gEGOx48a4JSe
         qkz0YKDPK16lRRBBMbZcgOq2W+u26EoNMuGSol90/m8Sxg1MRSMoV9wIJZN59KVIxlZg
         GcGzQTTO9wx4QIHNSXL/pJIZ3RbuVCSlBbksruHIzilDWfTcU+4poSp9aO27dIX9SqZu
         Olk7nz6UPASRL/qyZak4r/gnYkMQzVEluc7RO/ZN/yikvIGNmKGPS49lbJWBS1GHnW9n
         Wk+gFwQTTXRYGbzgdxDnPVhTTvl8ssbEc3+x78hr5slyTgjE5Tf6iViur0j4hcb6iCLt
         vZbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH+o5AstXpQnAA7R19Zl2w4IWZtQGDOMdT6bMZna+q/TbKxx7gb0UliCDez5vLAmClk9aMxa48vY3ei1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF9eH2lfi2whSja2VbrM/wzd712xshFMbTRSZzU/6O6Rz8qu6X
	K4HiN0hQd6HhsfCzAZsgSQLH1kbluj9RCzhDYr/BFuv7ShEPuE7PEa1Rtc/I3EyPDgo=
X-Gm-Gg: AYBFou2lZrdlqQjG7KGKPDjHYtl8VjXIu1Ae5/7r9tr3jiB5VylsyakV5oztzcgyMxW
	bk0eyMcPINqyBTQMt/lpdUXfyBpuVT9fv22228yDRS/6h3vHr0UKmdSgHgGb/bujtJIAXZs5OPl
	5qXqEJ4p0P4sv85zBcOUxPL6pqfVEjyuvOfTXhzI1usC/x47WuC52nN2/GZlnZFA1sLpUdyhaBk
	DRWFDQHIva+uMusUGk5kMS6r8XzEjb3iixQAW10J3NZQ4lTSBpEC9E8F/2MEPRYdKn2nk+OACTL
	jtWMMzN/nKM4KToZh2JWfKXszA3oeBrCJbLenuHYejtUNvLMm4tV1rXcp76/hduxMU9RfAlB1tb
	kDtU7zgKgyZPrjIvSjXeDtHsrqy5WHSBxa+yiTS/3z0Rngt3RY90987v32uIi2cra7LJvQucoYZ
	o55bGCP8bijCLmFHNBm9KRrzEOkGAtkKttUqqlafY4KP5HVG5NHazpCh1s4OzqzSxvQ4Bdl5O8K
	RS6bYCaDAOx1ukw1RpQNw==
X-Received: by 2002:a5d:59c5:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48dba7bea5dmr16393442f8f.1.1791795045347;
        Mon, 12 Oct 2026 01:50:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:fef7:ab03:44ed:97e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db99b820asm19710565f8f.24.2026.10.12.01.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:50:44 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:50:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asyfY0gZg8OkU1PT@linaro.org>
References: <20261011022802.4069489-1-shengchao.guo@oss.qualcomm.com>
 <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011022802.4069489-3-shengchao.guo@oss.qualcomm.com>

On Sun, Oct 11, 2026 at 10:28:02AM +0800, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:
> 
>  - the subdevices are unprepared a second time by rproc_stop(), so SSR
>    and sysmon notifiers see a duplicate shutdown;
>  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
>    that rproc_attach() already released, e.g. iommu_unmap() on a
>    disabled domain for rproc->has_iommu;
>  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
>    "stop" via sysfs takes power to -1 and returns success without
>    stopping anything, so the remote stays running. A following "start"
>    then boots the firmware again on the running remote and fails to
>    re-add the still registered subdevices:
> 
>   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
>   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
>   remoteproc remoteproc0: Boot failed: -17
> 
> A crash found at attach time is no different from one reported by the
> fatal interrupt right after attaching. Factor the crash handling out of
> q6v5_fatal_interrupt() into qcom_q6v5_report_fatal(), which logs the
> SMEM crash reason, clears q6v5.running and reports the crash, and call
> it from qcom_pas_attach() before letting the attach succeed. The core
> completes the attach with balanced bookkeeping, and the crash handler
> then recovers the subsystem through the regular RPROC_ATTACHED ->
> RPROC_CRASHED path.  With running cleared, qcom_q6v5_request_stop() does
> not wait for a stop ack the dead remote cannot send, and handover_issued
> already prevents a spurious handover on stop.
> 
> Assisted-by: LLM

Cc: stable@vger.kernel.org
Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for the fixes!
Stephan

> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c     | 22 +++++++++++++++++-----
>  drivers/remoteproc/qcom_q6v5.h     |  1 +
>  drivers/remoteproc/qcom_q6v5_pas.c |  9 ++++++---
>  3 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> index fe148b4b3775..51b24cbd4336 100644
> --- a/drivers/remoteproc/qcom_q6v5.c
> +++ b/drivers/remoteproc/qcom_q6v5.c
> @@ -147,15 +147,18 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
> +/**
> + * qcom_q6v5_report_fatal() - report a fatal error of the remote processor
> + * @q6v5:	reference to qcom_q6v5 context
> + *
> + * Log the crash reason published by the remote in SMEM, mark the remote as
> + * no longer running and report the crash to the remoteproc core.
> + */
> +void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5)
>  {
> -	struct qcom_q6v5 *q6v5 = data;
>  	size_t len;
>  	char *msg;
>  
> -	if (!q6v5->running)
> -		return IRQ_HANDLED;
> -
>  	msg = qcom_smem_get(QCOM_SMEM_HOST_ANY, q6v5->crash_reason, &len);
>  	if (!IS_ERR(msg) && len > 0 && msg[0])
>  		dev_err(q6v5->dev, "fatal error received: %s\n", msg);
> @@ -164,6 +167,15 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>  
>  	q6v5->running = false;
>  	rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);
> +}
> +EXPORT_SYMBOL_GPL(qcom_q6v5_report_fatal);
> +
> +static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
> +{
> +	struct qcom_q6v5 *q6v5 = data;
> +
> +	if (q6v5->running)
> +		qcom_q6v5_report_fatal(q6v5);
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
> index 8991ff090579..a0507860a21c 100644
> --- a/drivers/remoteproc/qcom_q6v5.h
> +++ b/drivers/remoteproc/qcom_q6v5.h
> @@ -56,5 +56,6 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
> +void qcom_q6v5_report_fatal(struct qcom_q6v5 *q6v5);
>  
>  #endif
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 56179b71fd2a..99f627db6bd3 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -562,10 +562,13 @@ static int qcom_pas_attach(struct rproc *rproc)
>  		goto disable_running;
>  
>  	if (crash_state) {
> +		/*
> +		 * Complete the attach and let the crash handler recover the
> +		 * subsystem from the attached state, as for a crash reported
> +		 * by the fatal interrupt.
> +		 */
>  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> -		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> -		ret = -EINVAL;
> -		goto disable_running;
> +		qcom_q6v5_report_fatal(&pas->q6v5);
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
