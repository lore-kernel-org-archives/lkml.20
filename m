Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D03C3443
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073731; cv=none; b=oPpaDcZtVwrL4AbNs6oC2N4QPVn15lFMYYjXoIUloUzitxO/xcoJpxIHriKEFrJ/YMaK4wxb2dfGGg5EGKt0wgsBiVfwqijxjbfpRiVZaQQD8p4jNk8IdjLUGLjZr8ETfT2bSiYAuzIpMqCV91O5OgdMvfauqSCWqNJWeY9L2b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073731; c=relaxed/simple;
	bh=/A2Fwd+9+3agfDel93uvmLAzyFdulq2jHx373bRNuP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ty5pqiXFIy5ozzOtIMeNDffaAwjDwhP6rOVzkZ21fmb2kP5/zJ04o6cmaaXtj4GO4SYs/e/9v7eJh47UxvGwWghXPY1QMRIwMN+/B95F6OKUWiON9LOCe4TCgv2MnJhAy32/ShiSyVHVvgevNab6bJnHo+2g+ve6LfFryX1q2O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=q3MR69iH; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="q3MR69iH"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso145472a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073726; x=1789678526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WJxP3qg6bq1oKid3neP8OLauam4Io159DZHymfuNtU=;
        b=q3MR69iHn0RY8dFStvfBYLlIS711TnZP6i2obkEa4Tv+UcqUhErfE32yGVLx7KsNPZ
         byOPuN6dCUuUqe3/2ke0voaOgHQ15J3/TxvcWWR4CxSJOEpK2lr1SMfGnOaInGirOPoi
         U9+d3LfXKFyhZDll6x3PHgbEjT+cwcQHuy5x0TX6NRwWCTVQU3beZRDRVuAh0HA2/aBm
         hRUZMjdqg173YDLJS2lNLwhlVe6CdCPQXcqhDquiXxweFjiNGZq+83YorruH9lJIDIpy
         Loj4/drY7cGjraj7X3wfak0K7BuP8+V9NIoQl+OU3sqOd/vflIr+mbJ3Moss3e3ZrWoR
         5L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073726; x=1789678526;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WJxP3qg6bq1oKid3neP8OLauam4Io159DZHymfuNtU=;
        b=J6m1ZLenoXQZC148twUIr+t+Uj13er8oNZ4VU+ZLrTJgKCxAefGPiwng76KNkTL7/h
         w1U54HMnQPtvwKxwdgtr4O5Ur2qywzHEaMdG4J7WtN+4YqBsGDKh7xlQQxHW06B/gzdN
         +YoZb2cLS6gCsUr/xjnii48ZMSXnOx8jhtEgiGLUam7Og2uta+xlTuQ/4Z4RHDHZ47AG
         MSFyeZW4stXxn0MB/kMoO7I/XsX7zZPkdohXKvrTmNAgBY7DjRxqpcc/jjDBTvyaOCgW
         RQ7nCY7UfwY5LIOARqZT3kevD0VkIhvMCvW2HEYISavZ1l+QN1hJcWNwNzYDIS/GcQAz
         PLrA==
X-Forwarded-Encrypted: i=1; AKwUvBwzvjAeZFRD8saBTbZYhGgm9I0JTthvHr3W24xFxkQHfiZUpKhor30lunsTSmZfmmU825oAYsYnZZXLFZs=@vger.kernel.org
X-Gm-Message-State: AFuF++lFw/cVkq5mo0oKLDSYW3XUGdfESNJKgygv0XW005Rvjz8yQKDA
	ITaf8mjlE0BRReex+tOCQ6DNRkIamhlxGkrosq/I+VuT6oji8QQRT3NwkjmMxGU5sXY=
X-Gm-Gg: AYBFou3n7ti68NicIu+t6yMuwmDEQzJMIENQNI6K1n5/cP8wZ/F780rflKOr3ItygOE
	146/JPfdhE9lMTlPfReogNjNAEXzvfzlBw3WDIHfUwdOwEeCTo1emSLfWc4I09Hk1emSPfQgFq+
	Q5geBREMnYKfCA7EW4krJ1kQMbl37R/SmBr8QBUk/bp4Dzxw2g4Lovql6P9y8YVtD5nhwFFEHNf
	b+LUlBiKH2XZZJE59qCdcYQGKjYvWF69HRZ6oaRp0PNHGnbRZNnxqVztCKtizvt4DEsT/Xv1e8J
	Dmz1EBhsshJcLVuoMRPDRP3rPiRwqQc0Vp3fFLFz3kFK4HMcWWLLga48mtIdTpLbW0QXY9ZghvP
	WAhPjC4n3D0FEXwnNiO/reD2qpLLTJdjmxoUx3dpj6Ytb9G5CklGEFl2zl5eeN4QYs2eNcnY3yN
	WWHKTS0ki4N0YzVNmOLcHbsiDUCF9Kjaad0exQMMrXYWtvvhhyxlcYd9S1KssyRlrXIvONQsVD6
	Hb2WWyqq9ryQqrD5ZRF6wAhQBIfVujZgbbNBLpAEJz89bQVbe0=
X-Received: by 2002:a05:6830:6abc:b0:7fa:ab72:9dfa with SMTP id 46e09a7af769-803ff447bcdmr479781a34.18.1789073725724;
        Thu, 10 Sep 2026 13:55:25 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:25 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Davidlohr Bueso <dave@stgolabs.net>, 
 Vincent Mailhol <mailhol@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260908-fix_gpt_entry_attributes-v1-1-a4dcb417e8fc@kernel.org>
References: <20260908-fix_gpt_entry_attributes-v1-1-a4dcb417e8fc@kernel.org>
Subject: Re: [PATCH RESEND] block: store GPT attributes as a raw value
Message-Id: <178907372482.484803.13802362688033738030.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:24 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 08 Sep 2026 20:58:26 +0200, Vincent Mailhol wrote:
> struct _gpt_entry_attributes currently models the GPT partition entry
> attributes field with bitfields. This is broken on machines using the
> __BIG_ENDIAN_BITFIELD ABI because GPT always stores the attributes on
> disk as a 64-bit little-endian.
> 
> No current code consumes individual fields from that structure. So just
> remove struct _gpt_entry_attributes entirely and replace it by an __le64
> value in struct _gpt_entry instead. This lets users apply endian-aware
> masks explicitly when inspecting attribute bits.
> 
> [...]

Applied, thanks!

[1/1] block: store GPT attributes as a raw value
      commit: 74ea55a6ecb3fd69b47b2b8a6f6979a6c79c7ce7

Best regards,
-- 
Jens Axboe



