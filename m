Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349463CAE8F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022149; cv=none; b=SGd03cuVZndiK9da003M9+yqrWxUyq8jCsP/YApZRnHj4pvk8ZECNdDHAH5V4Jpsz+FUaIOOa1QBzskFCHvw2mtD2as0jDuvEa8QTs73wZj49IXtmWv7mXqcA5krK4XTkrTalZpmOiwIySbc+r2KMS8TVFRdS4+sFsXaD/BY1Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022149; c=relaxed/simple;
	bh=EV9CYgvynfqPPxDLEZ5SYU734gHfgS64XMZag01l2eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tSNlMxkxUcbWu+sVNITOgAykecEN/VadAajSsYjMGTPrlpljbGEiB232N9sP34edhuVjof+OX5S5d2BIo7zvaUoPieGucuqrqtXC2bqQzkeUsPQSizMXN40b1j3ETC1Dra3dYPDa0GhMbeVdMHUHFZQhmlc/07cm5FBDMzSOa+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbImkt6l; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbImkt6l"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso54730535e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022141; x=1789626941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47UBI/niL6S9mV0mk4dleceEw56xBW1KNX8OcFOEg40=;
        b=fbImkt6lAxS4ugKTgJnYeffqnlC/tKUlYreBwIaoxBf+56sOZrFAf3ryvDO/fzTI2L
         /f1PTqzXN57NWwMpqygqUaPi4Za0RI/IPnSpfVq7RtxYDAbVc2KRZw8QQr+4i9f4MmUy
         XdUzkraD1GQ8O9MPQ0ENTon5wN0b9NEzUBmpmc8lXk93e0ws2+FVg6+UJrjBLuR5dTp1
         AbnQXzJHNlhiQ1DVZGOv7jBIddPbSCzk5flsyrmBLMZSPOLp2AHehpXlc3pvoGEl7wNk
         rgQzGu73XsY0Slp0BsfWF0ftSvPzcYWq86j5bpMO+AYy6UcOkbi9Dae2WjVY2Vv/V1+x
         w4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022141; x=1789626941;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47UBI/niL6S9mV0mk4dleceEw56xBW1KNX8OcFOEg40=;
        b=c/0ed+GNVP3gdaSYEyDu2GglqsaB05DCwc7V7M0HwSCssjeQBUwCbb88i+T+4f8yx+
         tGh6cNB5/3gTy4jo6L0jOqLhymUMvJBw3BCSCAO02ZZ0qlIdO3MjnS76ykAbmAR+NZy7
         IehMbKkTblqXdHsfCE0A9KldZsPljfRfB4PMw/X/ExNiXVAPOfLpy6PPJl7NiQaRuYfW
         Q2fMTDy7Da2brIe3y0v9okTaTvcWeyHSfz03+5Ny4k4iQ+/CbxH33lcUM7upzNLLa5pD
         mUaLOn7CwkvWNXkpzRCFkRPkwz+1FXcxeT9L9kZUrDKdC0GTQDAxRef8Ob6ar5op6nUJ
         qTKw==
X-Forwarded-Encrypted: i=1; AKwUvBycaSPh5Ml9uBRjM536wQv4Sli9nVYKcgr+uLVkOF2b3wKH7mW2LTHykIPIOmtoqiAhQHuXwd5WyLQ8IHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kFTNj7UJr7QXAsOOaA5OTg4ilEH8+lPPmIxViKM87ZriCB9c0Q
	AUBT12jsrNcno8u7jszDgfdsSDZ1drNNExceCmLemu6H+JQiTkiF65R5
X-Gm-Gg: AYBFou0VoG+K/R4rS9+pnyucJzK39IavZ1nlagnUlct9uYgMVUxdAQbpwVwKWpIVwIx
	8VR0oZnYohhk4dmMOPJ3yh+qoMkIwR7IATdhLr8qqiIaXkzHCYspxp/q3rx04pYgwKfCru5uBCW
	G1LmqdTNe/Hb0VowQ/tuJ4ih/zuc2QWp3f44Jfea+e2Pb7btp4+XazWtqeWdtjx29NZx1jNfZr/
	+fM97S/ErPMRJTeh99n8O/5dc1p0moOW5vuvpKUA+FeylAc67jOsHtgKsbtR+hB3UGyjxwNY7LZ
	d0kr/qunvVzLroJUNPGnzuN2haL2GiYB3YN6hyW6+0Zz0wyVkw9CvfiyfGlWBIu5IGCC4JUNHie
	bwzoLuIGuEe6GlXROJXPugEn7uiaySA6+aaJl+mJ6zq5O8WmUJ+S22CIeGbC3eWq3bwFwysspa0
	al0aRF5RJUdQvmv5kcWhjkilYP0ilKe/4VxITHjg1sOr6ngseTIZECmezJjACed6L+HxF/GVZDv
	MbWPy/h17GL51jI8Vo5hZ0FEYFiOIti/h7qjGoaKr3DJnmw4lSfQdU=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49d1f109802mr89066405e9.7.1789022141345;
        Wed, 09 Sep 2026 23:35:41 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm241531985e9.4.2026.09.09.23.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:35:40 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: jonathan.cameron@oss.qualcomm.com
Cc: sibi.sankar@oss.qualcomm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 10 Sep 2026 08:35:30 +0200
Message-ID: <178902213027.4725.14870667006708702053@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909152014.000055d8@oss.qualcomm.com>
References: <20260909152014.000055d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 9 Sep 2026 15:20:14 -0700
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com> wrote:

> > Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>  
> You don't add that for a review comment unless it results in a whole new patch.

Understood, and sorry for the misattribution - dropped in v3, which is
otherwise identical to v2:

  https://lore.kernel.org/all/20260910063440.4677-1-okerixx@gmail.com/

> +CC Sibi who is a whole lot more familiar with Glymur than I am!

Thanks. For the record, the numbers in the cover letter were measured on
a Lenovo Yoga Slim 7x Gen 11 (Glymur, 4032000 kHz sustained / 4723200 kHz
boost); I am happy to rerun anything Sibi would like to see.

Thanks,
Oleg
