Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9952933B97D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049389; cv=none; b=o5twd6vZO/+Tfg//9k1vHL3/rxWo0eFnnzf/QvvHp8/vbKu17jSObSjkqzY7sQiQQPVz5mppwAi9E5hGKiOkpIILJK91kx1/P7ssnflopXYDP3yYsXMLSPwlhOe652MyBNFfiJ2I8XA2ahtIz4q9USJW6Hoj4D/Ech7FTKAEYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049389; c=relaxed/simple;
	bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uYn2w5J5oVJt+daXs1WWwFKQigqmPpeDAQ+XxZKAnOtknKbdMq22xh6Gn7si94Fe6kyqoygLil4BZiYFFk5L3dsxhp/aBzyuTO+bf0lXHWKRYuPcN0i5k51cz/FE/ZpE+qxqf0u14ZBG/i3VzassCGiAmi1P3P3JZzRS56hDyuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouTBjH0h; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouTBjH0h"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8625b35df89so311236b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049385; x=1789654185; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
        b=ouTBjH0hP/ivORcuIVjyqendS1EaF9czp8DztvqOfww7HMeYukwyro+gk2ZG7uUSNN
         cFJEKWeMjOSmlaoY81JHyhPwn/VKst0KdRWl1vSTr9ol8J8R7USRJ8lzyVd3THpsQ7aJ
         rWWLu78aHc1m5DRmHR3w2qYrWbNGK9vUOb9iZqXvcbTq2YHq2OpCTa+hL/eiIEvOHERb
         hWHIA4FNNv8QHmMW1pzpTRbUzadyn51FYiVYI3n24/sh+Llgm1A0rSUPDbjzmWgR535X
         D+5eHoQjvXLhETspmpgJtGpWG1yk9sKEm9/AgH4+3o/wmUOPQo1I4ejAjlthR+FnCXQ4
         Z48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049385; x=1789654185;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
        b=BJnMe7H82svuqTtJQoP6HVx+iY1fWCfPzqd49+9jlQPSBhdpMizsTu/prjsPcOB8Lg
         1rbW2bmkjiHkEszfmovd6Z+GSvBk8soURFumh9b0+UmMHKU8OfHLOaeb7v7P5tevoDZ2
         6oy+Pmkvi1XWBbCiF2NjUYFJKRNmoGfSJziGWWlsi/+uXjJvb8PK9/tNrYz1f7q3LhlD
         xH2Gf9NNL8FykLSN2i0aKYX0Myex9XgeXw3zmvop9uCtv4OFFNVlZUKTQHf6YwHT31DM
         qO83XzajUAnWmbSb4qudNFH2sSiEhib9PJ91vGZaIPMkIlXtQ2GUrX7rO0YB13oJu2yn
         leOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzog3XX39oV5976MUPRrk8wJ2bStstRSCv7CIRYHhq06EI2SkmQgJrfxocJxCaRGk3e2tSBfsi5G2stb0I=@vger.kernel.org
X-Gm-Message-State: AFuF++kRxF2M4oKAKtE9CW7FY+h43/7m9czjohBjEKWJkEuJCJh1cU0Y
	37jDG3QTvO/vVR7bpOp3H/+ZspJEjxMJpCQtpSdm61JjqxDH8qkVfYI4
X-Gm-Gg: AYBFou0f1Ivd6uNE4QZsWsBDahazXNzuELBP7vALbpLc9sA8cq3EVG8qfI6KpUAkhaR
	F/QM3R3BfFAK6nSyi00fSofbMpo6NbdkPqevdJlIW7fNkqh9xNvXNyrsT7wXJNLVHl7pROjsqN0
	OP6lYm6Wcp8uVwzJfloMEIgQ+WYUnFujwmMJHOVDlDGSlg7/f1iZY3vsHfZiJcCRwZYA4v7WUKC
	uo2m80ZdIt1lNpNgAuSbGPDlv9b40/YJBDf6lZ+cvzzvCPzPqRaZEVhYp5jGAz2HopgcjHKl5NC
	vXlrAprDRgdshUvAWCq8OoCGq2/tBCt/j2H1x8BEGC1dViaL7tt7bsV3+1Bm8Xrlp7L34VWb1H4
	sMq70l/2cdF019Q1l/VecJxGNO2q/1OT4va2xfclkUj0Hui9Hdq4uqUc4GFtozPHIw4r9n10XSc
	yUa6TjpQRDVZM8ubqlGP/sDXwD57IMyUljgKyrPAer8wqb6fQRtKd3ug==
X-Received: by 2002:a05:6a00:1807:b0:869:44c3:c24b with SMTP id d2e1a72fcca58-869ad9ba9d8mr3437552b3a.0.1789049384734;
        Thu, 10 Sep 2026 07:09:44 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153f417f2sm8006059b3a.58.2026.09.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:09:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:09:37 -0400
Message-ID: <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Alex Elder <elder@riscstar.com>
Subject:
 Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller driver
In-Reply-To: <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
References:
 <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Philipp,

On 2026-08-07 19:51, Guodong Xu wrote:
> On 2026-06-03 09:34, Philipp Zabel wrote:
> [ ... ]
> >Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> Gentle ping. All tags on this one are collected:
>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Alex Elder <elder@riscstar.com>
>
> Could you take it through the reset tree when convenient?

Second ping. This is a MAINTAINERS-only change and carries your
Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.

If it is easier for you, I'd like to ask Yixun whether it could go
through the SpacemiT SoC tree instead. Unless you object, I'd suggest
we go that way if it has not been picked up by 2026-09-17.

Guodong
