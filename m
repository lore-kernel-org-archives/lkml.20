Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40B3546FC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356963; cv=none; b=Tw0hpVrX2jgU41bTZ0Ny5asUs0TNcN3nQtoUIcjVB95DYbuK8yweLjwXFW6ZhJe8exM9kL8xRb8ubuEmP35ZRTnYwfi6D099QUXs7jrmip6SpiHewb0FjarPlhumtrj1Z2gG2tThRYaGBbGVf2G0DO5RiBrYSnMYwkIKkfpwRmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356963; c=relaxed/simple;
	bh=iW3JVrrvUcsHlZnMMLphvKMG3KwNUPby8ziTuz6RWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ927bCnEjLXuEtnRnpRaqYZUO7y3wXUwbHlam34buXfdPN2vNp/Ps1KU1AcmHKkC8bgWh7xA8tmydT7/TLmN1nBnL0QIrGpN7T8Hy3WuYWadktwzV+lQSuDu0IhmvZIKde9ngnQ1LQHSO1cf4Tb43Oi20dhMZsAAUlwFBADzv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2A6pld5; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2A6pld5"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-34ceab2900eso2369771eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791356962; x=1791961762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e34WpKUSaPAFWF8n5+ufAQ5hbBzjHzSllBW72um0g/Q=;
        b=p2A6pld5VNzoYyirqz54nL1QRvqxRL1ej6qCNZCjVwaEOMDxE9g8sn6kvvNm7yt/++
         ZjTHzIvM6cOsvWEv+KhQTQWGQ58AtByZw68U9+xN7oZWjmYLekTir23pjAGfThrM/Cbi
         9qEQnO61e5AvvFOlE/njnRNdKxaHzomOFVbwG6V90kKZoMNoWhvC1xTA+cpB8o+jiiF9
         g4Km6xZfNtEpYHiErsCnOJXO/DH+xl33kUMtiKokKySjk8Vc+aFcjhkWeV4ih5ob1t3y
         uTQogIpJbU0P4AmrKOaBryIGu9mkfGNmEakg99hOeBT7DuIrGLMYWFiksMKwUY9e8Gs9
         z6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356962; x=1791961762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e34WpKUSaPAFWF8n5+ufAQ5hbBzjHzSllBW72um0g/Q=;
        b=1z9clPQUfi+nVFDf6Qfmc9yooAMHORLWkUnyCq3hDAHE0ihHShYs/diNeWTolg0GU9
         TnANgaZy4CMFuuES8jTJHekGgJVl1HIPwUCRsbo8HDy+QMpueqRBy1zdcy7OAQwvmhI5
         9JiylfG/ZYcNeUkUEXGgZoh5a277okRb+eO8EKzyirqX2d7k+L6Uimjggyt/qv5QLyN+
         iRAVl3e0QiL0qCZyzQwNPiMeNdt4Yq7eM3Tolx+cjgQdeIEzXSr1zlTdviMqFTJVLFE9
         Psh6KRDYR2nWV+3wmfC20x9qQd613SDnS3FDmW4JvbBXIoUfb3DwLcm8EDr7QZoHvFDN
         uGdA==
X-Forwarded-Encrypted: i=1; AKwUvBxLZMIV8tFcc72P0I+opqPf8ZEUGsWv/JymoU3UblhIiVJ3atb5RHe+90BW8jk+AzUwcanKQ25r7siKX28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtHa7vyJVWw3+ggLVGFY3B3WEjRbl+TN5wVXoVgUuX5/h9zWfy
	07AvnamzHQExX0YZwFcFI5Ui7kREZRSL/W4YZoL/i4iUUTt2DH55g3bUv+ZJJIR+IHA=
X-Gm-Gg: AYBFou1qScQuLSk32JFtS0sw5rk0oWN/jwzgBpeh1xoZnuq6Md22jwEF8vVYN/qJ8iI
	IITTt/QVPbN7lmWCW7nzX2q7i6XlseO1nneIg4OynTBJkyQ1/1BVwJ/QwUGq2OfiQFrNRhnDk+e
	ZXJbbXumCl8eHEyTIj4pZukJ/z8sFUD7QSgOicTRqn5Z/yl36oGVgOr5RO/s6cononDySrt+Srf
	oQl4i0LEYX7zLD29D4Lvshda0yLNg4BGoPPNc81PnMtP2ebB8jKeaa8JzJCpmCoD6xHG77IHqT/
	kc5+WgW60oM/Rf3yojfReAfLj6QxdqX3RvaTLquQVPS5fjo7ly/MWir5hUe1zARrtxeywTkHnF5
	lI5pF1OHYaIXxcoBuHdM7Rbc9HtVeFcImPvr431XM9EmlYx767DLOHzfqGR72KGcfc0hFHRO+VW
	mxR0KFOpEk/zthyranzWJ7JfRtzLACbYpUeRBNz5142KuP6HwN2VKyTKn2fw3zReRsqioIIs/FN
	NvDk5mP5MFG
X-Received: by 2002:a05:693c:2512:b0:33c:e82:70c9 with SMTP id 5a478bee46e88-3515dea1d6bmr1296696eec.32.1791356961645;
        Wed, 07 Oct 2026 00:09:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm9797157eec.19.2026.10.07.00.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:09:20 -0700 (PDT)
Date: Wed, 7 Oct 2026 12:39:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ilia Lin <ilia.lin@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-nvmem: Add IPQ9650 support
Message-ID: <asXwHVcEyf0fpvhP@vireshk-B250M-D3H>
References: <20261007-ipq9650_cpufreq-v1-1-bb808da4ab2c@oss.qualcomm.com>
 <tnmm2misly3wct7out4gybimrql42si47trcoygaquan2gm2w7@rzqqkefwdmvh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tnmm2misly3wct7out4gybimrql42si47trcoygaquan2gm2w7@rzqqkefwdmvh>

On 07-10-26, 10:07, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 12:31:56PM +0530, Kathiravan Thirumoorthy wrote:
> > Add IPQ9650 support to the Qualcomm NVMEM cpufreq driver so the supported
> > OPP can be selected at runtime using the eFuse value and the
> > opp-supported-hw OPP property. Also block the generic cpufreq-dt platform
> > device for IPQ9650 so the NVMEM-based driver is used.
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
> >  drivers/cpufreq/qcom-cpufreq-nvmem.c | 9 +++++++++
> >  2 files changed, 10 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied. Thanks.

-- 
viresh
