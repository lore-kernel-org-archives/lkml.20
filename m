Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9822435AAB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964085; cv=none; b=GTbDJGu6u2zu00I3U8lGw2wT/UFUREHtPNa9ELw9+MAjxQtBb8QB/4oaYcAV7CYtXk82WDYP5SvDRsPgbXjAHFVacg2b02G8BPuN+O/YP9H606pd82ixoo8TXaEHEri/ccZt37WNt6216aB6FvpzGaIqAk/wesJuoJSw15z9lFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964085; c=relaxed/simple;
	bh=16hksQs//RdVLFuvKyiS++F2SQ5vrk8MCYmqqR/nkGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3QWs/WJxu1HeUsRwXhRNy9p/SmkRHZuzJcPxuVShK4AOuUp7pVhbdeqpHtR5rCx99CuB7wpkHA99Mqk3Z6acvT+/1cNuAtJrTbMGck6K7KlcT+mgp45pkzazs25SLezblfsQ9ibrsaLEWlIEgJHeqsFINygJ0SqRATXZgAp6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmym8c1+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmym8c1+"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c4207ac26so3583049f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791964081; x=1792568881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmneww5mKP53qtLk5sZTycPhJoLLQoam9M0U8cXGxVI=;
        b=vmym8c1+CVTQwZT+sCnhlqu8Spr71dNpW8sWYYj+HUiugiWX1IvOrjlCS3B4wWzy4I
         gAKIgzQG0DxdHFEtV8Uj28wkLV51wZQGa/9/kCjDL+aRwLTqehVjQMSvYJavpbjc5bQK
         e4J8EeRoC2V8WvsEWNFo8pnrI5cATgN7/8mIsz3owyLG+8hNotVYT/5gSNgz8++q26B4
         F6APAl78WbqAKxK1eW+SgE3t3FLSVWWV8mz5e5gkMkJa/myih4NtRhbuY9NnuZe+nbIL
         IRtS0sn6F6wiYb7c+sVpD6fIzUBX52r7IRy8SkB18go+eB0+EjBqw8Yz7gRSeeJfplI7
         fxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964081; x=1792568881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmneww5mKP53qtLk5sZTycPhJoLLQoam9M0U8cXGxVI=;
        b=BoeKWKKLN71aQKOcjSZAGJdndSsoIS1vUIE9ntQ3VXg2cCsqZhAT1tXXRs0+ye0Rdx
         +o4OoGwmEwpkeMcIxPqvaGkL1wXO9b/sWRmAzoevjwNgNlrB/LFoRFqRxcnA/94/QUjb
         aEYt1njyvV88Wv8wfVDnDtzzvwEgmxBF7UQOJtYLD7gdN4fniDy0DQw20+fhPgfI+Hr1
         JRLTwA3Hf0aTv5nfbV0X+P7Bh91sxDT22yFfFhiupPRRiQh1NKUSGgRmkt75aTwc+7C7
         f7kAG0SGg17STNFOxngTOMbGye31jvzDFAZ6gz7lesHIicoJnqiZf8uX40rSR7XeexAf
         Rd8A==
X-Forwarded-Encrypted: i=1; AKwUvBzwZHvduecn3D34K0fGgTYqmYL+SAi6eq2zlXLFfSZHMs6h6HIa2NroX4BSECCzfwSUt7YHDUP5Ibx6hn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpu0lns1HLNKySap0mJ/GPR824C3ks1okVRM/DPLWlrsnZjHJX
	bVzSNaktOuqKXPDbZY+yxcnAAZNPiC64ns5rOh96vs8Y/IACEiQnzFGgpniHps5lly4=
X-Gm-Gg: AYBFou1kJH9UzIdAwXK96yFyyQ03whi4ifjihj+HBzdd6WY5efF1YIfaklp+0xEtNjO
	haJqHNaHIihUysOYBopnqKCS9K2ZM0XkJIBXmANHrz5MA4aTFZNV4vWkl9+SGCKINjhMuOlTgUZ
	7oVYXt30hIz3actzV1Q1By4bmBmS3IhH+BB4BHzNBsOF5op5UQ5XqIy058jqrCe41EsprwOgWOA
	IiI+CqGkmRo6S3NA/9R6cHKlMa8aMWdspXEsYGL0SUJX8jXe0YpaXKAY7ehwDlGqqRtMdIx/uEW
	cufbaLb+j/sFvMvUzoWjqS8MDKIjCUfQuaHB8xffwjqfahAxvbSjC4mcPh+mRXFk9lGptTVNO9q
	5SgKOMPpcAdvil+O5XJbN9E+jhZIeia8X55tapvm6SzcBwHZczSBxeFTttHup8yBoTNbl07z8fE
	Gg3MjxW7Qpmb7kevwZ2Zyh3QYk5ePRHAOHmssptbaxKTUZ5qIiU3K4976BwmS0qGn9ycVUpeH+H
	IFiaXY=
X-Received: by 2002:a05:6000:4553:b0:488:6bcb:ec92 with SMTP id ffacd0b85a97d-48dbaadcfd8mr20006696f8f.17.1791964080842;
        Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:b6:d666:120c:88c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm11407149f8f.9.2026.10.14.00.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:48:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:47:55 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <as8zq_GMu1pkoMYA@linaro.org>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
 <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 03:00:37PM +0800, Shawn Guo wrote:
> For early_boot subsystems, probe unconditionally marks the rproc
> RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> bootloader actually started the remote. If it did not, attach sets the
> state back to RPROC_OFFLINE and fails, expecting the core to boot the
> firmware instead. The core does not do that: rproc_boot() treats the
> attach failure as fatal and the remote is never started.
> 
> This is hit on Nord with firmware where XBL no longer brings ADSP out
> of reset. The remote never publishes its inbound SMP2P entries, so the
> very first state read fails (debug print below) and the ADSP stays down:
> 
>   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
>   remoteproc remoteproc0: can't attach to rproc adsp: -19
> 
> The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> Linux has not yet interacted with the remote, so there is no reason to
> defer the decision to attach time. Check them in probe and only mark
> the rproc RPROC_DETACHED when the remote is up and has not been asked
> to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> path is taken. The ready state is read first so that a missing SMP2P
> entry -ENODEV is treated as "not running" before sysmon is queried.
> 
> qcom_pas_attach() keeps only the fatal check, since that is the one
> signal that has to be acted upon once the rproc is attached.
> 
> Assisted-by: LLM
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Cc: stable@vger.kernel.org

is still missing. Would be good to have these fixes backported, since
the original change landed in 7.3. If you used b4 trailers -u and it
didn't add the Cc tag after my message that would confirm my suspicion
that b4 won't pick up that tag. :/

Bjorn might forget to add these, so it's likely easiest and most
reliable if you resend again with the tag added in both patches.

Thanks for fixing all the nitpicks!
Stephan
