Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868049;
	b=bhDM/S/BDYDAcC9TQKfBjph386jp7M0mfxBuDhBMv3EQ5IAO2hSjKUB6wSPDQGvEm7pD
	 bAVfZ0mj+FcSBQSWb/nKb6vB6SWGXkenQWVUMA3lTdcapLFbNJwQlqdwDqxjCtrbub0SB
	 JmFvIVxhj2g5yRH5fclVzKtW5ct3R83JSkLBblwB5tupxfr63XWAcseA7fBDSVYSTH6Vj
	 RdrLXIRCRBtnEM7ysCVk3DChwzv/TmTF3BMqq+IM24I7h39IkAzJN9VP71ybiblynv6wD
	 SN9ZCW+D+01LL2QTfAfSCFHZ9W3/sc+LnejeIds+qwWPdN3PdV+3cX5kLF098hyuL6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
	b=5LhsK67GNjWd4pD0HqNw/yAJbqF712ZSHS85cQDXuJAGU+lQFIBzbQtG+vEPmg/FV0KL
	 5LqekPtsv30zRJnMr7maV4aMEJrwTB+klcGa/HjEtgZbN63y5W/M9rQCtPyKfpbJ9Dn1O
	 NNHgzIs+GIMyMs2FGclCoeQfAx5wlD8zfqZ2hboo11Jl/yxmOeb82MOEIDDnRA3FJZWak
	 HrqRLWwxCqJUMVBKCqkrzlddHrVBcUAVpqdmxmeFcb2QXOcIBiQm8znVh6VwlKRAbxIHB
	 gkmOJUmnzr61A6X22C4wB+cxiGV/rLB4JlAJOgZiT5WItCncZmoUYv8ix6OeSDp9MMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZ+gm+R7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1893D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1893D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZ+gm+R7
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930c0f9c1b1so171136685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:40:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793868047; cv=none;
        d=google.com; s=arc-20260327;
        b=o1eC0irFFRfrj9mlTqMIl4iF2Pb3DYRES48yBVqOu+mc2oMugOKMRgn0ESNUlvOwPq
         OdtCmhNIXUIjFAdwDpiwl6C1GNRff6csEg7atYoBEw9DNF5d8MchvmsUy3X/JbtpJ6xf
         aD5afAVqV0/oeqG/hKUphoZC+liN0lUidu2MCmRfVBMEK//7Z9w2I3q1FzYyQu66B49r
         KeamYaNT6sqphYBEOfKq2vyWnzLzIC1L9EFDxDmCgj+15whFQsgpu+eHnuNAcGE+t+uA
         Rs/Y7INAbBg49bXkg8FvJlD9NGX1PUu9uIaKq+Rwzm/42mSIBekS39RHa6+1u0C4Ffrp
         Ym8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
        fh=ym+EIMwX0I9EaJHYuxsSOfLVJQlGXu7qZVG6ZJgxqzQ=;
        b=LngJHedvD6aW+VC8a+mf+KLnC3yC/0vqfApDjKmSfOKk3rWKVRref3yVF+C29ROYiI
         mA9WhT/aKJFApimwc34+yvWl8MCl0eSmX0lD1CxaZyi3Fx4a9vvJsxfgi4L5kYVIic5s
         Ql++xsEa5klvw726/kjleWHyeev5wt5BAy/gP9LfKNUVIQSoZz3sYSl3gdDiaBotN8+F
         9O3xNfe0xiH16/VN/NJZaMBlN5mjUHjqnYTZyeTSJ6IgH1LrruJGxDBAPndtLnQjPj9W
         5CwQkUHe0TSOqrhA0FagPbOzx/fCkKVa2jxOFZOLY/OarqLIfwRtmVxDTPF1eXjnZpmC
         9kvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793868047; x=1794472847; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
        b=HZ+gm+R7VieQONVY13nyzwBD/v6AqYAUd1UjqdLW1HVQAz2Hmo1rYPGBieA7NC3Swm
         ZPMEp4trRmfqXSqAXkKvkDno5NclXxQEaIGd0t3TsW0uPUJwNn/Wbkxu3tW4uk5bVQjq
         91VS6NxLadMsvtU0RuJo251+RW926MZEhD4A9CZhL2zPpp19RsgAuXkpiT3U+JLsRwic
         s6mKGYwGJHof9ftWapRsjblyyTi8FaXbKgPbWv+j9gy9SzZ8/c7n6O/p8dvdkUGzFyf7
         ngTr2ccjR4y6RaX95c7Rv1NSmNIv8uMExnrn1A3pqrrc6I9UAdLed9MLJaU28iU6uZeJ
         RWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868047; x=1794472847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DDWemAYLpFySPEhpz6MZnQPpQ/I0i4/WwxV7qkmL+Ig=;
        b=EBOwH2+pQ/IQPJ4fA0NX55aYERshz5QEGHuIunEoiRCeISiEYYaIjHqZWAkdAkVd8N
         OMvrd9Aaa+LkOs+9MaupA5B/dYZWrw+9pwQm/LvvJszj3gcLsrqc81MO+B3ynDVaVk6f
         k58JM7KO0L5ij4FqELIfkXBi7JJtBvaqpCWmoM9Vnuy4bRDpTxOlqa4IQemWRtbBm3R+
         GR2TRkjq1OEcjYdNtg8zaSrwlYBFBsY6Bkq7TNmv13HOnhi1XaxAPC+HczSIJph5Y3jE
         J5jFh6uxjTZGA9sOa8hLrMpaAvbWrqw/iEO2VibfTOa8X24ECYxhWIzen5xw1Gpz3ZAv
         oeEg==
X-Forwarded-Encrypted: i=1; AKwUvBxjYTMh7ZxTwmZgEA7q0JCV7ls4nwU3dT8Yy9TBA2ZPUHLosZL/BwIER7CvE4SP6Nka2Vw5MGOmfclpXT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gOTrJ5WgJ6PmI1XjKYMsdbKyAJchnhiFxDXFcNEN8tU5DPKmc
	EMv8EO/nWvGBroNVcxnSLHikZ6fCETRtDhrH77Um3lvxavhZTpf3hxBYOwHa1Ex8UGq54vDew8X
	OckH1y7jfpo/6HzkOtMZlBEnXMTX3yoc=
X-Gm-Gg: AYBFou0G6SSXo8sBTEorQ6BhjLNtzx2ACXSAiU0BmtduujRDGd4keCdF7lghdUxsXTN
	/eTegsJrgrO9NjDgHIqvY+LHR3qoSndN6nC8m5oFobRh0h3VBMSyhKrjfDx+q1VurOZ/TyriAEx
	EPPYiLP6YilM0p2uUjWvUCNnoW9PX2QmTGWSeGg1p9H+0ncBn3ipp9LHF/mZ1fHNVWJCi8I0v3Q
	ogYVKvuSRpVHLuosXfqVsruGYeCmkK8qttMqURF9paozcnD+x8xoNJedocE28a9taoZ+WwfLLon
	tzlzkdMSQoIpmGdP+xsUA/PwqB4wouIy1eOKO8VMnQjD/ZREVixYS0uMoVRiF8Z/xGg0VyBtgtw
	HFodgkgW4N0O0LKiMJNaPGo/ouY6nb0vDy8IZuu1u0W1CGsKDhXQNwacBOg0SayN9WNvGRl21lO
	TehBU3y6Jk7zzt9NVm3kZRSg==
X-Received: by 2002:a05:620a:461e:b0:93e:f930:5ed1 with SMTP id
 af79cd13be357-9442174519amr2850724985a.82.1793868047051; Thu, 05 Nov 2026
 00:40:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012220728.14861-1-fzeruhn@icloud.com>
In-Reply-To: <20261012220728.14861-1-fzeruhn@icloud.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Nov 2026 18:40:35 +1000
X-Gm-Features: AclHuK9rSpudI5xPUp8K5FrKXjgGz5azoUEdbeTlyuitC4ycwsyAChqMlEoBybI
Message-ID: <CAPM=9twX71mND8dKKjO8=ZOKAkcVD-zcpvcMEL9hv5z5b_-k-w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: keep MOT set between messages when
 no_zero_sized is set
To: Finn Zeruhn <fzeruhn@icloud.com>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 08:07, Finn Zeruhn <fzeruhn@icloud.com> wrote:
>
> When aux->no_zero_sized is set, drm_dp_i2c_xfer() cannot use a bare
> address packet to close the transaction, so it clears MOT on the last
> data packet instead. The check only looks at the position within the
> current i2c_msg, so MOT is cleared at the end of every message and each
> one is terminated by an I2C stop.
>
> This breaks E-DDC reads of EDID blocks 2 and up. Those are read as three
> messages: a write of the segment pointer to 0x30, a write of the offset
> to 0x50, and the read. The stop after the first message resets the
> segment pointer, so the read returns segment 0 again.
>
> On a Pimax Dream Air (three EDID blocks, native timings in a DisplayID
> extension in block 2) connected to an RTX 5070 Ti with nouveau, block 2
> reads back as a copy of block 0. The checksum is valid, so nothing is
> reported, and the connector only offers fallback modes.
>
> Clear MOT only on the last packet of the last message, as the commit
> that added the option describes. Trailing messages without data are
> skipped when looking for that packet, since nothing is sent for them
> and the stop would otherwise be lost. With this, block 2 reads
> correctly and the native 7104x3840 modes are listed for the Dream Air.
>
> The same problem was pointed out by the Sashiko review of the patch that
> sets no_zero_sized for all DisplayPort connectors in nouveau.
>
> Fixes: f0ddbb1eed18 ("drm/dp: add option to disable zero sized address only transactions.")
> Link: https://lore.kernel.org/all/20260827015758.0B4FB1F000E9@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Finn Zeruhn <fzeruhn@icloud.com>


I've applied this to drm-misc-fixes.

Dave.
