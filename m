Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4AF16A395
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788480837; cv=pass; b=B5M8lzLvcfMtB5kRTn3q6FIJ93WMR0HjpME+8gi8OqGV94n1qGEB8YLUP6xBEUjrf8AlLYTm2V+ppuJsPWtWfabJlsowd3na/6F3sKA3cwbkbCJm1/wMvJopW2vri1Q6aG+CV7gPoPtxwRsDjte1lr1mWDUwUO53q5DWAOk8LOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788480837; c=relaxed/simple;
	bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLLepiZAEsMoJbh/dCMUU8s4hCTdazPq6sIGZtP9yW9W7bPBSmxGSuuypqsTvbw71RWd834qo9i3kiodRGzyXP1FQUTAuw3LV2EbhNHKfXRqQg2Z0F9u/uFReBcS4cLa28NodYIISn4KK+cfeaaB4zDEBcES9B7/nhMoQdcdO50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DC1UkgLr; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DC1UkgLr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-485852d03a4so489679f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788480834; cv=none;
        d=google.com; s=arc-20260327;
        b=lKwqhID7uKxmsJy67Bm56RwMcU0kRxl/SjnIQV66Xalc7VbmF7nu19ctHbOdnhVpdT
         kTOIf3ris1B0y5+xT+DFgxn44MH6qRwQ+cDrE9KSkLKW+Ab82aNNA9LQtTq52ap9UUX3
         GTKZkWZKcy+/bNtY2JuqZme9AWX07d489tB2L8hkW3ZGxh76MNGOIxDrkS1eLCbXo3gc
         A9fDzKKMjZKU9IC95+abgYzi/VQlZiJkceKl2m2S13qQh5xA2w1sqmTK88F7PihYdo+L
         Q2y1RS3AsD9LW8O9UccTSOrorfGjH/UQDVQO/fVKSCb/GTtwb7Kfcq/ge2aKccnQ02ZJ
         k1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
        fh=+oycWo1vkWYoe31a87hzYE26Q/CZ6L9dVEtGEgNQSXQ=;
        b=pO2f6uc0K10zxsHFHgfopXxlF+P9eyFwuXdPEVYqsRbir5oL3avDWC1n2ldlpuOqFf
         p2M5C60s960z9v2pnYur/SXPZ0thZmVAD4fO65VcEXu3eNhEBYo3Yj/vF/YAwWluLqgJ
         rCQV8dkjeWINGCayXZMroSbw5r3Ct7SiZanB6KWtwn9JA8CVbNUXKoeWSPGKwVgGJ5nw
         c/qpC1j8GwZFpu8jdJY0HufOdWGGMIUPREdiZnD7fFbXJbX4psMXxHpxKPU3mWyWKUZp
         C6rrbHnzaTfFT67Hc9GlySodpSLzZ8qeXjPA3K7H+RpOCe2OsNX8QIL/gCjKANFTV/Uj
         UMhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788480834; x=1789085634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
        b=DC1UkgLr+71+wuXvfiosJgSfoGNIQ0EzEugTdQ1R8C4F3bQPQtrx5+RPz/bzMNMF36
         B6gQtLw8V+CRvLt1uCKCeIfqSSEveUAtM4xsUZALGbHA+TK2ihImq0Yqny0Wt4esS0f1
         0voi574SiUC3t+bQofIMzapspOTUTUjYBMXE79kTGLjozkjYMvigLGdCca6uw7UVHHV+
         CuE5BkLg1UMEu/8LIuREWl9ht+hXV3bCjg3+r6+rGXl+lfjJPxgXqOdaPKelzpvnd7rc
         IJ6I2ei+cszch6QTgAeA+RavUr5ip4YbanQcxm3z14X74TcZdCkfcQOIePj18ynu8vtw
         JBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788480834; x=1789085634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
        b=HY3AkuWoL/5iCXQUH3cAV52E5NVrvc7Go2ZIFd6Ul3juRp/myQAENy3YGo60K617Xd
         eoagXohpa9CjNinRS7igYPByDEg9PczWpKXZx3sLey5j/80nn2p1RrkZAFMIam+lbL95
         9S+w54TcFoQbl8FSW/AKezDAIMo9BNzDyqudnvoCiudyGioSfKbEcaQgKISgeuulAglJ
         zsKNOlLSR7oag2XIDmF7xm6qJZuFbJgLXSwChAn5hBIbvB6SSt9IjK6rHLkEZRDRP7nC
         FkI7lzA+1RaYjRIcphOi1QVPKjiJ7wFw9GGMYTza4lgNDkaiP9mqHdq/zvm+7SOy8QIl
         6NEg==
X-Forwarded-Encrypted: i=1; AKwUvByCC1dsB5zw1PkrsAyDCky6kuLD/F4CddfwR8M0PL3fF6xn4rS+9XeuMnCsg4zA8vfUtPSLTjdF2geejO4=@vger.kernel.org
X-Gm-Message-State: AFuF++m+U8sdQXW0hzABRdMUrSvyxtETfqEXzaKFam9Ucj+FHiBgvtnA
	5S0CrsYaqROZrdpqc6YlR4seMxZhr9CEOptLBimA+dPVTc1NqRNQB3nIt1Jl2QvjWC1P570nWHc
	OHMZ/6v+bj32jz1yUJJXAkQTSHbsMaV4KdPaam5pP
X-Gm-Gg: AYBFou2cl+Ce5jFrCYZnv8fzF5PkhlsVP6uGBg3KbCFWRxOwLaKnFvDIdqVeb72Ybx+
	2BLXmfPBLZMw6ONbHHMtCNiFBFe8d2Akb9rpJBdltV38xbLyZvZaXcA+vSvXFNM42dOQi+sr4G3
	jxmdiCq9CzbOn+gOqdxsGAsiZKuw4ezkW2YX4BR1Xe/1zv5VPDCXaIJZI1S1tNeWMML5VB2krSX
	aR3y4jE18PqwEGEGRtjokwGXbNakQP3BbFicUDw+AoMjZywAWBR64nNH9i6QD5Vz6lpntgDXqBm
	VRly14yGeRXO9IjDWZR/t4xKjl6BqwQe+Yvep52gWuZOfpfhLTIGnkoT05INrn3yDMXoDWCAL/s
	=
X-Received: by 2002:a05:6000:4694:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-4858703f92dmr4163408f8f.4.1788480833517; Thu, 03 Sep 2026
 17:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818205717.1492247-1-jthies@google.com> <20260828100120.139648-1-marco.crivellari@suse.com>
In-Reply-To: <20260828100120.139648-1-marco.crivellari@suse.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 3 Sep 2026 17:13:41 -0700
X-Gm-Features: AcwNN1Wk6O2yEsLoan2NVGDK0Tv_I8WyUzGKtzunFIJmpV5caiOTAh0Fu5dyStQ
Message-ID: <CAMFSARdUrE1dE=OkQbU9++qfYTUoC4QUSxdqKWFOPj_fqDKoHg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: abhishekpandit@chromium.org, akuchynski@chromium.org, bleung@chromium.org, 
	dmitry.baryshkov@oss.qualcomm.com, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marco, thank you for taking a look at this patch.

> system_long_wq is scheduled for removal.

I'll post a v2 switching to system_dfl_long_wq.

- Jameson
