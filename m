Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB403043DE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945497; cv=none; b=APmjLbfGiXWgwypT5eIBpP6SjTAlLg7qrZADc2RysXE+VL/eY0HVhr5frEB9Ke58orwQ5tDoqayTI5CU6/li+DPNB280pVoo0xmHQy6RnwV8IIsM+2HKhsPZKPabutFuQLkgD70SkmcZEi6wrN6+5Zuu4xFeOVKGv4/y6yVxzzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945497; c=relaxed/simple;
	bh=uogOlJYX4gd2XJKCKqbyiAtKsfJrF2ZNwa7lsSTywSw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q4BIH3UmPsup8Hm10Q7y2lJtFiVPNKr5A6SzWBmL/f+e2/3AoqE+UNnp/EK10K9XxzknRQwjNDHP6p9fngxW2R7sJs86c9HdRGiYFQwOigvEK63ogWT2e7+Wmx9gfaB9IZpUGfHfflVfe8izRUF5Ndn5sBpUxV00gVwtZ7CfTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MYWyZQKJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T5uiI4Vj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MYWyZQKJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T5uiI4Vj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
	b=MYWyZQKJN8rVfvmaIZbXcsB4kS2cPAEIT5Yn886Cc0JC74Crz2tYCkgEfWdb5N4lWtAsuh
	Z8oBixrPfhbn8b3TfMeJ1hkNgmxyxcRWA+9LNE31xYSXuLuJ5rVglRkin9BMj8eF8CO0WM
	dEv3uH05l0ga422nQefrOtdV+383u+Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689--gDbo67tPXGQyT4rSg5ssQ-1; Fri, 02 Oct 2026 08:51:33 -0400
X-MC-Unique: -gDbo67tPXGQyT4rSg5ssQ-1
X-Mimecast-MFC-AGG-ID: -gDbo67tPXGQyT4rSg5ssQ_1790945492
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4887782ab2dso6166699f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790945492; x=1791550292; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
        b=T5uiI4VjJ1TPQZrIX9wPE9LdUNUyk4Ta51D7k9xQAYeTSh6oPJm6zj7aj9asZDl1q5
         1+1s33GTSSMKB4B4fsGQBqLBjfg1Hu9T7bampC85jaoTvcMxSIe7I4CAXkLTvfTS2x8U
         X0GHcf1Nyh9zBxiPuLfyZq2rHa9EqyC/KJ2S7fFgfseKMQk84YJSeFUPgrq9IbzoqzwC
         bBPLOjulBtjyjqizUDA4TUqr4aKvpwUmUSzGMs9xyM5zzcFcYaXPZ8M0z4ItNlzefl6s
         Jpf4/lqZCubtdop4hCjp1emL9cQ/H2IzsU8Cv4b1uP5CMw6M6ZrbwrRWuD+bzjZddolL
         2QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945492; x=1791550292;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUF14AtWHioqMuqb6hp7f6A6RAbZhDlhHrFpBFNr570=;
        b=zat6mhpbJdVPkEGrjtaTXRjYey0x3+t04wi/aZtAyBwpHSTTGitd01r+0SQDZWl/u+
         +U3sJ/wIaT8lG6ndxCI4piMlehyojpj0E4mU6NoFgMXE8f462Lyq0fL48hGM6OIfdOco
         PY6gY+MCClCYoSjaI2ACXRP2jtVeS9cNgCJzFhDuYKQI2ktoQwcsksjMxLyufeZbInuD
         lQMPcw+mjgVKKdggd5e2LWhi55fMkccOHsHG/m4dWb1AN8PB+Fag3RZ3NaeJaudQVzC8
         GRGgzNoNjQX/+85v4MVakCunns5Aa/iC3tX5o2uMbmEu2jJgBxN2W8aD0/7juwC7okP5
         ze4g==
X-Forwarded-Encrypted: i=1; AKwUvByduXWinRwI5V/P1gFyZtcTAukiNaAwTT+M5UPgGZCl7eaCmCn2/Oj+/+qpe0GUap1lqB6bOWAkuzZM2J0=@vger.kernel.org
X-Gm-Message-State: AFq9FYITEiwoDPkFk1ZfA5el72xXGJ7jaCtnf8J/Zue4QHG6POL7usTw
	OGxsTk5gOCTbxIcz0bbJSz/el15GWWNXss3Xf9tLh/6doDyzMbWOAwElMB0E1THUCLltIjPcI6o
	s/5PW0Rbo6OyThdR86Gjj/j4h06bVyh5IecWXt1WhNpozNrw/JegOYuYkWCGQmTEq3w==
X-Gm-Gg: AYBFou108QXeG8m1SP6888mUCQTFeF3+paclUHgtn7gENWY1Ch0QIjodjdAK7xvLxkW
	q9C96KKlcZPZrbDOjT5awVaMFEAUtasuoobveibRI4CkPByB1TssTcy6wLmCRB4tqBc0Eyi8c/5
	cX9TrBKVrnxzMUxea2UUCYa7lMlNzcgJ4F4ZNEDBl+oRquIF7fLJZ2qV99/3uvB8FsKAcwwi+gg
	LNh3uxP2xhww+AeZ+EvAlnhxCJbFsdIeeTZzfX5QrjgNl4KFkpF4jVPKTcLV1Ja79aIx4q+sgXN
	15MgBpRtjQsujpBhW5SPOFBKRnxyjd2jkgot1s92cgZ3lm/ZuDfWvFUrcGpsBXnylmpiCFTnmw5
	ZY5MLozhPfQEC5Dv29BXUoFWAn1DiSLCNwEwhCa2si2ddFkpnTswMRUcBERQb/+agfA==
X-Received: by 2002:a05:6000:27cd:b0:48b:fc4:e84a with SMTP id ffacd0b85a97d-48b1271cdb0mr3218124f8f.11.1790945491966;
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
X-Received: by 2002:a05:6000:27cd:b0:48b:fc4:e84a with SMTP id ffacd0b85a97d-48b1271cdb0mr3218095f8f.11.1790945491489;
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253ae9sm4879135f8f.2.2026.10.02.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:51:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/7] drm/tegra: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-6-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-6-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:51:29 +0200
Message-ID: <xlv1bj9c6zam.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The tegra driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

