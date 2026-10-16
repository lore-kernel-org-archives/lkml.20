Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D53BC687
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163114; cv=none; b=bo1Z51tmX+uRY0Mrfg7hm2jPkofph3mlAcFjIyVXqDYjyWi4WnFj0yoeLr9Pg53I73Eyh6z2253XAyXUcg5l/W+CDlbbNlyI+0CEFK8ASrqKxQVkI499S5rKokOIeKwEdACEXUShoRO7tGmEDXzwiF/33j5NF6KLoOkRdXFc2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163114; c=relaxed/simple;
	bh=+ZLwGfcTnuWOjkXmHzANGbisqtehi9ORf1DFvCUB1/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sPVxW7tG2kWXeYNBYunbcoQKGFFjiFRj/Bc9lo8AO8dsWiIfJdXrGjdEZs9iykIq9HAMq9Kt2G3HlUSHOStPB56olDqrgLFvbSEy+j3UNr5lQQC2IiF1j2Vfy3ZFW7MspQGJEDz8+J3/RkTn6SIXXNg4nsydo6mCjomggbDXLCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWtL6RTr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWtL6RTr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac677668a9so59822a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163113; x=1792767913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZLwGfcTnuWOjkXmHzANGbisqtehi9ORf1DFvCUB1/g=;
        b=SWtL6RTr9xNINcj3EH8LYvLmkQ1FlDwZMAYn5FK22JnqYlZVe+Uifg1BGdPWeV5wOn
         s9yTDNk/JbIqUoZdyCeWUCp79u3ZhWbeuVRUDD2UEjCveuQyS3VQaHKBoI2/ZvzhOWAl
         ihAjaj9gUVgJBWqKDhXre8QLAjQdclK0mjiu16/F/BlzWfULIjsMkrqcju5uoTBf9Nzi
         8VlxtTKWX7WX+BwL1Yel1DUk0gILPmr3w9OIAiST4HIF+ACYVnlgzYOzwAcO2Arms3n0
         BoCAwPn1Ikg5Myv/gLBHqsYRcMzycIfvdMTpSBvxC9ZMDEtG/QnUE3sLoMoOLyRbLyhw
         MFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163113; x=1792767913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZLwGfcTnuWOjkXmHzANGbisqtehi9ORf1DFvCUB1/g=;
        b=m686aMMu58WtsOVKf0C1U2pmQYouCF6EQgpXxdQDJ8eghhECAaye6v7qNjj6y2J1Dl
         FRdIs6VtybjzuL+Cv0UauqxlLm57sv+2uOiP/KjvNkL1yKMbPIly091LJorXGFb+pnNY
         SSp9R4PX0jSIyzNJyk38lxkEr7UO0ZM9voKq9zTFIS52jJ46lZHqhbk5d+Xj5zEIoc56
         DX7MMs0N8QR0pY0HYUG1JyDQTTpEwjNgGt9Rsnnl4Y1khdeSThoLKvvJH6PmcE2IP3Ok
         Z8keqK8jpG9hRNbF/EC6AJ/fRzQNRBdSnUPnYBAvTIpKwZCv1JlitA0TzntRj+z60MA0
         SBpw==
X-Forwarded-Encrypted: i=1; AKwUvByVGaxGYc971bNxWNemXhyhZNk5Uuoj+Tqon3peHv0YZdaO8xB7az6sqSccvDUf8/AHh0GCgBl3x0BgA0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLPh1gYcs/RuBHz3tm/WRt7OJjurJXcNh5mEnajoZSmQViUS7C
	ULuJnxBst2JYlbguUVPvRdgsjcGOjrhb+uIYPWZDAXr0fFhJ/XSD/1fqgXqFaU7F
X-Gm-Gg: AYBFou2p4LDZ8QMG2Cp9h5kzsdLi5nCLVxo4tDl9OXw+PrJJGlOnzuL7vO/odYcJQIE
	b01xVpqJIj/Ax+032mi0xWTEC4CAko/LWYjClLAsP30evHhaiP9yBUEGMyK+yrE7BEPNXw90Ewn
	S27GZmcsLwJVLxsEE8sKnuBKYixrZWe83mfAQZKqDtlDvkj0rV2p/j8M/jgEqvtAvVK/LnBFPdu
	7Aiv0s2EgdzunEvwknZXrqR7VqcNtqw1+hrYSW+X7sFd5t22vbP1Yp2MC8QiMg9IzDePCmzPz5Q
	7al7etrrWXVAiDa0pTWwdeGVCFgHscRaMuJqn4nxt7e5iKjHhuEjs0kHw/bjRMh72Ks5B5KyD65
	C4vVTmOnJv8i3F8V9V4W4rYO7ASd8tOsaic7MLtgdEEpz5ICgAgIhmWRpb8i8L/JclE28CiXng/
	hGYQz7Y650dc7rdBGZqGrV08wE9xfqUCadF6T2y981OMRo/pQL6cgXanUFZdB2Ng3xiddmbFVmo
	5IcVh3vwqTO/onlMzPTWUuHdOFrX5rPNo/VgZlW6jU7gobvBBWPwosSwyoI86ht
X-Received: by 2002:a17:90b:3b8f:b0:3ac:acc9:8e38 with SMTP id 98e67ed59e1d1-3acef596050mr72223a91.66.1792163112603;
        Fri, 16 Oct 2026 08:05:12 -0700 (PDT)
Received: from Ghosty.python-cobia.ts.net ([2402:e280:210e:2e4:197a:43fe:563f:5948])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4991b8asm4527644a91.16.2026.10.16.08.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:05:11 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
To: Jake Steinman <j@metarealtyinc.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] media: Add Himax HM1092 mono NIR sensor driver
Date: Fri, 16 Oct 2026 20:35:03 +0530
Message-ID: <20261016150503.3363284-1-rshouriesh@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013123220.17716-1-j@metarealtyinc.ca>
References: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com> <20261013123220.17716-1-j@metarealtyinc.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jake,

On Tue, Oct 13, 2026 at 08:32:20AM -0400, Jake Steinman wrote:
> The staging/ipu7 format patch mentioned in the cover letter is dropped
> and not needed. With the ipu6 driver from media/next the sensor streams
> Y10 648x368 at 180480000 on Panther Lake (IPU 7.5).

Thanks, I'll drop that paragraph from the cover letter in v8.

> On the crop: I would widen the crop bounds to the native 1296x736 array
> and keep the default at the 1280x720 active area.

Agreed. v8 will report the 1296x736 native array as CROP_BOUNDS and keep
CROP_DEFAULT on the 1280x720 active area, so the 19.2 MHz readout window
fits within the bounds. I'll wait a few more days for review of v7 before
sending it.

Thanks,
Ramshouriesh
