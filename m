Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A547C4D9F84
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606098; cv=none; b=kpYtN3Ntd0wzX/4VRmBY2DPNasZh8dncxGX/9HbPWIj9YzxEXdc5APxA6Y2l0b8Pz8xLfjLR8ztYdt/QSsKM6a8hWVBT0AUleX48cpZ8HCTQmC975Ha2wH6NxUS14odmia72dtPwIh/Sreu0JfXOdssCDb91LPutNkaeSr9l51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606098; c=relaxed/simple;
	bh=xwRf/YXfVKDuWSpn9uR+n9HGgUi+CPlHNq/+qn2X6+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCovf/tZF1bow/1tEhGUiKRTuLDaTWgkyMGVgbcUW6hwYzFSWatx1pHe1XHr6o8Jr1P41PmCmFCYYqF8btne8aiElLMqvkgGO4goYYySNj9E3THuJkwDWrWEVBHDO5MZbxAvka33ikvM0gBFCaQ0cnzmiw+auq02TVvL9oAQGZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl8WzAE4; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl8WzAE4"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8a45b788a71so23578897b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790606086; x=1791210886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZsYlJKTGpvGATz0Om2YNQHbE5WZRaO8o4xFsELbjv4=;
        b=gl8WzAE4U1BtALlyiu4ANErV/JJEInLYTLwNnEc5RKxaHejnH9fW3eIXtptYsWLSB9
         Ug1KTzi1DFSIQTc/twAA7x2PAAFS2floriXOKstAlkvooo59mMZTgUa5cQWbnjgg3lF0
         T2nMhVT6TZfusojQ2gQf0HkHHs0stzqyLRqIfyM3JLBouUYV2XaJKbl3DQjL5atUKWeO
         NhPe0QdLE+GmWmRfMf6urgakZCZnGGAjnGcHlNFT9JVNX0+aR95sifItl1M2wLdywwXs
         A3Pph7+r4QlyLxcgwhcN0MtSRCRZoRf36z1z2o6sacnxnisikCfLcFbNS04TxpcwcO+m
         fmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606086; x=1791210886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XZsYlJKTGpvGATz0Om2YNQHbE5WZRaO8o4xFsELbjv4=;
        b=qVFPp6t3r1UlaO2TNSGCdgfDiR1r3A2JqAcrrTOemSI192AQ3xJVUgI1zjBrxd6rzn
         8SUw5YIXgDvCr7pAFV/duBGsD9ZH0QhVwhz3/Hd4/2cBQMc8AlAQkdbXgeAi2VT40l1M
         +uEJvrWYvwln3H7ykK+rVKq+idzmioK3KXePMA/+W2FRFOWi4Zsf45bvWQzIH82kHOlr
         IHqCrG1ybXXEED9Nuf0WGirT17iebBMAJrrQImCk+fZ+N7PAtsqvBeK5E/FslCKEC72S
         tXixOao49O1ys8ZSMuqUHSx62OEd0tdlLtDJ6u8S8EaPPVB7VEAnQkIs88pesqKgLiKP
         oExA==
X-Forwarded-Encrypted: i=1; AKwUvBzrOa2OOlu9o4mQ/bvPazo3dPTayhm0al9MwQThKjxQwUCFYIxP4tYGWXL42qtuVz5uzO8bF0E9oi0y5qc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfVtWRppDrexJbWeAaM9v15WSHzCPm/YMvddwnZa3AGKPIJvM/
	ytnFSDQSWSA5DONx5N1RGPScfATKJLQ2MwU0F1hyOt5DP5ilOVaYC94f
X-Gm-Gg: AYBFou2zqfK+vONwWeZW8Js/PvQEB7kIPn83Uoe9d4vdlG+W/tWz6mqWweKx5weOAKk
	u5qvayktrhRZ+3aWwUfCmzRvRfEPWkkORlcB33h2ZQ1OICBjaGY0Lz35V7WUba88pKxljRCQr4s
	BPmF0wpGVizs/CA8j9UlLKHmNNVOFdzSOtlFhYNGIAFGEDWXnlh4EdiukAycuP1ARVUlb/yn5Dd
	6SfCsYZSxPzH30xvVqcQslLPVnaRf4HqPxuw4pmzumxH1+XVt2FNVZOkstiLjgcYcdpkOFPd5EU
	SLehZUT+rF4JpF/QvRyRCyQLuP8SnlHdoLnbn7DEYbRGI4640IfKDvffNzXqAwiW6MEyRjMeazF
	QQcgCxxACeUrf0OJEwsdalXn+lL7P4mZO8bk5KaYEahN5jyBw9Xjtt2dug+b6L+MtzgU35zZ4Cy
	dYaIK/+3MCEi+tLvvfrVrzsfMQ7+esc3FNumNRr8pX79sBi4DJVEr7Ww5o+5db94e9NZAYfiwRW
	5LpPESzJcMWvuICH+KJpO+y7vlLGgaQGHdCI3Y/zqL3wu/hS1EgZA==
X-Received: by 2002:a05:690c:d:b0:891:c494:1a99 with SMTP id 00721157ae682-8a649978855mr63166317b3.24.1790606086291;
        Mon, 28 Sep 2026 07:34:46 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f8544fsm45489817b3.18.2026.09.28.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:34:45 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: uvcvideo: generalise the XU flags fixup to all controls
Date: Mon, 28 Sep 2026 10:34:44 -0400
Message-ID: <20260928143444.757654-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928114423.GB157191@killaraus.ideasonboard.com>
References: <20260902002553.34839-1-jordan.mymail@gmail.com> <20260902002553.34839-3-jordan.mymail@gmail.com> <20260928114423.GB157191@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

On Mon, 28 Sep 2026 14:44:23 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> That's a long commit message for such a simple change. Is it
> LLM-generated ? If so, you need an Assisted-by tag on this patch series.

Yes, the series was written with the help of an LLM (Claude Fable 5).
I will add

  Assisted-by: Claude:claude-fable-5

to all three patches and cut this commit message down to what the
change needs. Apologies for the verbosity.

> The code change looks fine.

Thanks.

Michael
