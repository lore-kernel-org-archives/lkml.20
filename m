Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602874;
	b=b9o18F66hRdue+US4wd1zdv8+BwiZSCosAqxAtOSAvbfIoeMZC4bFm1AsgbKAf8YS2n3
	 GLTrlJgSh3EEqb71ia1v3vHVDIZzbntckME/r1tMkT9ZKYKWIIK9JOyMVUbaTFQGodrDu
	 u+ikaZxZSdeKW88cUSCmTLuGJT/ub8CJttaJdO6eE3ruNwUi5UmTAuCjH7LE+UzRJKjO/
	 Zgq7/QIbTEv9dSqe9yK0fhi7NaQ8lwVpkbEKwYWWmCCoRuwS2klx3BpjLWnUasVkguxev
	 z0rv4W0dvvCElttNArcdKZA1bI4AGtt6Wb6EyBXYZ7O+7UddzthV9M7J/mH6DmYOH3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IIEwmheUGWh0VnqKa35MN/XtrDI3rgz5r0klSZQPba8=;
	b=HjdL4RZ9snEKvhnYQzSPqeZi6eObzYbLA7ZWAq69poDkDonBxgOmtKDeMNbzRAbuP7oB
	 LcAztm+yIpe/S1G6WlSIovAHtcCCeCHGCdSZoM1nAldWZP7cNwRFZX9dvO53HOserNZcZ
	 tP7pPNOBq5tAf+RTQkzlsor+c3esnMH3l19NUk/qaNg/A3TNtFvigXGnAoD2AJTqnR3di
	 RewEL8tTVYjlj/s9DZYJe7ploGHOFdUr44XZcan3MOkazwFAIDe6SjAlLblB7nPBdtxCy
	 aqnsGqsxxpGEK7OXTbB3Q0eRIAdegOQ42jlLEPTlboFhStQ/6emrNdWIM7VwY90XjMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MV+0efPP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4B606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD4B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MV+0efPP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2001dd4e7so9227905e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792602872; x=1793207672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIEwmheUGWh0VnqKa35MN/XtrDI3rgz5r0klSZQPba8=;
        b=MV+0efPPjre42SVRq3x08Nqwaif8RbXYpP/8z4IZC9aOkuID0XUwy/drnZy+oc2V7U
         +x6j6MDkKPPCHgEtU/icfbi5YZkSM/4pmVt5kAgka6sSoh8m2MuL9dJTd33xZ+FSW3XF
         M8/3m2BYNewTj5uqB9hTQ9xHHXtulTbRx55m0lgFdEHMP1PhhaUJzLEfeWYtVMVApNsy
         +oRxH3bKVcRA1xc0HEFKiywzEspm3OzT9qmr/DFyMVDx7U8rgA+cGB/oXvHezl025tOC
         s3IGb7yrvmwgqvg0P3/bFgd7xrwZT8KWG38ToEYi8hdgDilPMoZqn8/a/avR2AW9C1c0
         erQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602872; x=1793207672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIEwmheUGWh0VnqKa35MN/XtrDI3rgz5r0klSZQPba8=;
        b=SL/4GbiYB1ifPwIk7/nB/ihTyd2KzFn27nJCWJAxyEsw5YJ1Tg5ICBOkP1C9PQLfqk
         z7wkeYXTWBioO4wAIu6WcZi9wtH4h9hP5DmHC83nqKMG9VEHntQqe6aeiZ4UJ8Xuey39
         wL0nfB9DxPDeRNhJqxozijfRyfh1dzvwr+Is5UpvSkIVIoUB5c9bS7Srnk4GgCzycrkB
         1MhzoW9y4NbADKl9l6DSaBZJs8NWn5MTXgYB9fUTRTp59X/l3EbDOhFedCD9XD9dMhwB
         U5BZ3FUsXs9SoSWLn/RYLkgaMwNK7vf6KZTn8glQa3isfaNINZNTe+j/BAxSE5kl/gmV
         PUuw==
X-Forwarded-Encrypted: i=1; AKwUvByGfpsBYFGxbsAWWPRpk8yb0KhC57D4Q1xURzVF4Ki0C+eaSA997bzx1pNjlaNAueZpSdIFgZtbSpEH3s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkz7iWGCuVsXPbPZ7btJLNpqM3Ove4TUPJcvCny00Su9wXTgqm
	b/OSM6HBcloXd8NCKJWgrTQtq66EOpimXRIlzHsGhviOt7nI0/iSGJXWQ/IwIK4ftf8=
X-Gm-Gg: AYBFou0QWbVlOWJi7S7w1dt7lufY8/Qvj+S228OVgKojWN+WQSUJ4FmAu7ZkBcuWZIV
	KbwMJegkCiZ9c35wR0tvGwc3BmqfAwEcdL5k7p9a+/mn9B1hHr0P+JPS9DiP9hha/JzImG/8GD4
	jKe8suo85J2E1dpaF+ix2EbO8zhoKtJGNAx8SdAfJCCj0Q9KPML6OWrvmew+wCVr4cZMceQKTOJ
	8ILXBruMiOQBkh+JdnXSu79eqcfDawahz049tnhYXitz5pJZ0Qgrv1GIcfMuj2RzH4A7od2eltl
	ASYX3EK/hUSM2A/iTjn5G5IAbhuHbAggNeQXyO0Zig4ewE9WS5hE9u+cMFFaaEC2MOpNpzW/FPF
	K3egRWXgYmn0A8XBl32Oldh1R3ZUVKWrm6dyHa6cg6x6wx4nVsQlEhvmtM6utAhMqFJET2+bcgV
	1JstceG1ErtCy6SPolQT/X+gIO1SSEoQ8SVTdc/p+NjrDM4/ey+XZvOzdRdkYLRsmhnKRiceaO1
	aTEAbZ29Qxm6qquj0B8sm7098hnDf8qK1OciAk4Yg+0oWi1x8qDym2jW+ZEzZWJQ0M=
X-Received: by 2002:a05:600c:628e:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a1fdb0a346mr56541315e9.18.1792602871904;
        Wed, 21 Oct 2026 10:14:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:9608:8385:755e:e1cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203b42befsm4715775e9.8.2026.10.21.10.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:14:31 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:14:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	konradybcio@kernel.org
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	johannes.goede@oss.qualcomm.com, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <atjy8ZVUW61VBa26@linaro.org>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
 <atH0oW5j9pxsTty4@linaro.org>
 <aca2cd5d-18e1-406d-a062-e219478b243c@oss.qualcomm.com>
 <ath8tHxHOdA7G-Bx@linaro.org>
 <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d885d41-7d05-458c-8364-e206dab12792@oss.qualcomm.com>

On Wed, Oct 21, 2026 at 06:20:55PM +0200, Daniel Lezcano wrote:
> On 10/21/26 10:49, Stephan Gerhold wrote:
> > On Tue, Oct 20, 2026 at 06:08:56PM +0200, Daniel Lezcano wrote:
> > > 
> > > Thanks Stephan for the additional information, that's very helpful.
> > > 
> > > We currently have an urgent thermal issue on this platform, and getting this
> > > thermal mitigation upstream is important to prevent overheating under
> > > sustained workloads.
> > > 
> > > Would it be acceptable to address the sensor naming and description
> > > improvements in a follow-up patch, so that we can get the thermal protection
> > > in place first?
> > > 
> > > Of course, if any of these changes are critical for the correctness of the
> > > thermal mitigation, we should address them now.
> > > 
> > 
> > I have no intention to delay this patch. In fact, since I'm using the
> > latest unmodified stable kernel on my T14s, I'm also suffering from
> > these thermal issues. :-)
> > 
> > On the other hand, we are at the beginning of the merge window and Bjorn
> > is unlikely to queue patches until that ends. The changes that
> > I suggested are purely cosmetic (the names of the thermal zones), there
> > is no need to repeat the thermal validation. The throttling behavior
> > will be identical no matter which name is used for the thermal zones.
> > 
> > IMO we should use the remaining time until the merge window ends to
> > correct the naming to avoid any confusion for people reading the patch
> > once it lands.
> 
> Ok, fair enough
> 
> I propose the following names for the thermal zone:
> 
>  dram-board-thermal
>  gpu-board-thermal
>  fan-board-thermal
>  wwan-board-thermal
>  chg-board-thermal
>  cpu-board-thermal
>  typec-board-thermal
> 
> so we can capture with the name the ones related to the non-on-die sensors
> 
> Sounds good ?

That works for me, I don't have a strong opinion about the naming (maybe
@Konrad has?). I guess people reading this might mistakenly assume that
these refer to separate "sub-boards" in the sense that there is a
"mainboard", a "Type-C board", a "DRAM board", a "GPU board", etc.
But I can't think of a better name either. :-)

Thanks,
Stephan
