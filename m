Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89164AAC5A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656919; cv=none; b=VdKLyEEZo/GauegE2vQXJxFBgub+4jJXYIjZLDN4ItEH5ZbVlSXuTlpfqBluHnndgzodfJr56z+zTQyxEmLkwWYJbWd5c6e8fxX4X+UPEVZNWYui9psN2hNtM2WlS4iWTUXYi62cPj5eGrAFO5Kwp2jxGk+Fr7u9kmdVFyUn5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656919; c=relaxed/simple;
	bh=6mUCiPfgFcR53z0p0wqDnczQ1/FekAVwOl0ASYekEMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S0vnotwaQTpPTL5VeAQjKB19K53kSYKWDhx2k48a4xL1gR+Dg3U/WGroPmQpdNF98WkuNUfwN+2ypDGPjuOUG6Qi0CIlVU5SzN1xo3I3No0A+/aTXjvWQJE8s6d4X0ZTVo7cmtpvfsGf5sptThvUTZi8lNR7jU8osypy5VdGs4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCH0/CG2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LF4kmRhS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCH0/CG2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LF4kmRhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789656896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AXFSc42fFXOGOg/f+O9pg18PTmXdnbb3QObGTFVGu4=;
	b=CCH0/CG2J2i7SQO0ljcrpOQPRF7gpyIEumKLRaYE4+I8Mjp65sx+jHPbFQnVTju+Tziszi
	9l8wRObz35FQflpOgOsHmoO8yZa/WvUmasjTFCu34rk+7Qs58dBs1deGchh4Bjgx7RNw87
	yCDypW4zuGUiw78m3IZlsRZtiEvY4JY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-O5B4eBAJMdaFMHqqbQPbSQ-1; Thu, 17 Sep 2026 10:54:55 -0400
X-MC-Unique: O5B4eBAJMdaFMHqqbQPbSQ-1
X-Mimecast-MFC-AGG-ID: O5B4eBAJMdaFMHqqbQPbSQ_1789656894
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc0097865so25976811cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789656894; x=1790261694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9AXFSc42fFXOGOg/f+O9pg18PTmXdnbb3QObGTFVGu4=;
        b=LF4kmRhS2iorgtdJ9GUMVK01qbt/noWh/hWZKD4h8ta2lILeuh/9APABpJnTSzIXg4
         W0kkw37hFDLtPxfGyBd5yavcDl+OQVYlGrf0NKrEkIzPU6c/pPnat+l6zE4UdW2OJxEb
         y5io8J0f5KeWgS35TJy9LY4xxb8n2Cgz80QGBZ31Gl0q4zOvMKgS8HnzmOXdc/tFd4ld
         G3rYCYtkwV8PtL3WqRJXE7JIl8ILasmUiKMe6hVTgxQ3w5xYkAoA1aFJOg/h4Azo2EyY
         l35km2RmZ4O1UeeezxYO6UPpDtyfCesyuFWxdx8Kmx3zQe60NIy1u0tajY8q8H+XJGFS
         4XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789656894; x=1790261694;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9AXFSc42fFXOGOg/f+O9pg18PTmXdnbb3QObGTFVGu4=;
        b=cUljBfTEUVEZijYxc4k9gRigGClzHg8xcVqp4cfPyJF0qfK1LgK7TK+hAJTkiJA25f
         oYD9gPXSim2jkFcaYztYBWTj+k3XQFE/qHVuvRtIqzrFztY7UZC7Fw43y/Z7CVR3vESX
         EEppHSToT2WSc3Wmbt1YY/EFbrF5z73/+KfZVo38GUtocyQZZM3vfmYDKknhjqHTXSOY
         oJDsgk3Exl0SqifC+bjCl+A+/H3+4GFmPT+5FgfHfTpRGpxsi+HZCdjRbx8OkOlmTkUR
         wXaV58svQZceDh2RKWtfW9Yt1t8v8SuKxOSPyCX9V1QD75GGtuLBTYkeqbH81N9LDPrl
         x8iA==
X-Forwarded-Encrypted: i=1; AKwUvBwfKcXT2Nq0iPYv6ebw/uydTyTqUV2/MinWh5+yT6Z4ZrWWGru5uy8mqZi4H1PrFIzGldIDYwrqbtK2UUU=@vger.kernel.org
X-Gm-Message-State: AFuF++kaaLM+z6PAqH3VwNTyqPJw9gJlU1jPufX3bcbjalep77seF2gY
	Ww1FogU4qxyBG4ITHHDEMaaZh2EnOOAfWzfxn9QmzcBDBF1ckQ+S3evUI4YabxFbNb+QT2qML6Y
	WkSNYWWLF/kyogz+k0zWEpt+R0/7j9fgy8ZjCwPrIRouTr/BnYdVukaAi36UbyVRm0P+uTVrs8g
	==
X-Gm-Gg: AYBFou1+o/Mi4IUiTcNPzyrpGcV1e4KiPr1Y2bOMYdxRhWeN0BchMbEmadUyHdHOl3m
	yoE7GdFCppGw7TBGDdYm3oTZG0q/M5FA3b9yV7sm/PBBnvmiSsbuC0hLGvbhnWNSHHHNslCykOs
	RvlV92x71Mi7ZxIXrAetAnp/WC5YCVCWY2JNu468U2eKIjv6Pr5mNWNLcSiFgZccxJ1XcY2WI31
	zQTL6JOlK2Or12SFM/gjEfCrfnpdevB1TS8lkk5hHmOfCeS3PfXZGeTSfQh/YzgAmsOjJY8JMul
	k6/Ph+3+Q6pXb4/WLiuO5H0qJS5QiCouXcDvbxF8rgF1oOmTLK7iGh9RpGzpPUfttXFoP5Q80it
	tHXX6Gbl9+eX5f1Dh3TvWym17d/pJhqMHKtccxO8=
X-Received: by 2002:a05:622a:17c4:b0:52d:f484:eefe with SMTP id d75a77b69052e-5327f54b73emr119219321cf.35.1789656894326;
        Thu, 17 Sep 2026 07:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:17c4:b0:52d:f484:eefe with SMTP id d75a77b69052e-5327f54b73emr119219001cf.35.1789656893856;
        Thu, 17 Sep 2026 07:54:53 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53259aee19dsm53067881cf.3.2026.09.17.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:54:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
References: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] clk: si521xx: correct the SI52147 OF output enable
 map
Message-Id: <178965684879.360090.5503590837229538426.b4-ty@b4>
Date: Thu, 17 Sep 2026 10:54:08 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=312; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=HRHMuNqDMyQ7VrNZVdhFpU18W+ly5/8zYF2raxiGR1Q=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJW/zeVuDNf/qB/xFU97jszO922X1pz33/LyflLGSdE3
 tQWy+pR6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAi7HcZGb7MWfDfe++TvoQ7
 Ns99Ax7LGVn83DihZtWloKzWH9ERT1QYGba+rX9xN20F85R1W2580ZGVsL+4cIlXb1fLJKM1bOo
 lLWwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 13 Aug 2026 23:36:50 +0800, Pengpeng Hou wrote:
> clk: si521xx: correct the SI52147 OF output enable map

Applied, thanks!

[1/1] clk: si521xx: correct the SI52147 OF output enable map
      commit: 744e436077af1af06b38589d1e034e4f8ea7b3ae

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

