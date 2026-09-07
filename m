Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874ED1E3DDE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753720; cv=none; b=qzcWhkEAfGJg5frZIuD4GnS6lmZ37rkDqXvAZWGavb7ZJ81h5fzwLgWsouc91BjE3Nqa35+IbQIkeyVVDZJSe9HQ4g4d6SvVow5ZujyZ8h0y+vKgGhIte+KHtO3Wa6cH9ghp+cVlKgl37lJeY7EifW70UZ6wk5NOzm9eLHCL70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753720; c=relaxed/simple;
	bh=295eWmKjjJSsf2Qb21fsc0R7caj2Ox8IuLV/wjJRXIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgzksxIfYM/UQbN251QU2qTD25/yN0PTMhl2Gl/ealjybOGilUTiXOitX2xA7KYRiH+kqNJbVN4wY1qUFl/GTPTaviTpu7Rn9/ulLPXps6W9xymXtsh2LHEJ80HeUucz9aXy4LndHBP9N6OQr5qmDlkmhdBaXiDzAf120dtWIZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtTz7Ll+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtTz7Ll+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4a95ab94fso3984511e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788753717; x=1789358517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJSxnvBJYF8uc7sGAY2P+/nrv3c6F1c5XrQLy8OPO8I=;
        b=GtTz7Ll+++qA5Ak0AqBb5mkv1FwdLgtsNCFUPoa3ZACT4aAHNxonlAHyDtVBaNIHlp
         gAkIDLI9w+MLtMrYtjkLKsIObMQTd7/E4jzYMQ//CRbRaLEIA3oywI2u0Hkm7IfpMf6A
         ek04n/AYu+0Xo3g+vgCX6k5ZThK+bH6ovkpzYvdNSM3fqmUfyZ8WCTQJXi4skBXT66b8
         Yrr5GY/8EnNqNUnvB7ptpIVlhQ1IN9x84RL4bUaCwoDaj6BjMWG/z95EbRsFa8Rq0EIv
         pEaBESN1m3kJpNaeZkravSisq2Pv+Q/sh5PjyZFdl/hWaeaMjhXNveAJNZsEOx7Bvc97
         LL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753717; x=1789358517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJSxnvBJYF8uc7sGAY2P+/nrv3c6F1c5XrQLy8OPO8I=;
        b=W3PbFh6Uf9Hyj06za6VsrS/jBtf7LpbBPU5foACR5gyL72Qwb2vbmD+kEWEpiR52Do
         TgsMAT7mYCMW+F+LHO78EglNKIkf3l3KWGwLstA2ucDRavh9J3etIArd9LqjgkFHZBdV
         Db5K/Ny6fm4Dz6ofjjXHVP6vOHA9Q5+dse+hMjohQayGTDRnDAa+KBKpVy+vipUC3Z5x
         J+wqpcFUuxnvq314VvuU5p24VLYogmIh8dHcuT1DIoz4k0sTenIsvASvTn0ZxAUS7ah1
         JxphyRXNcLQvCtZUGR/Ej2BADQoWg6jQ+zRV+zn1yXCWEXiZTKNmNCwUpdGfVL5eHOPM
         z19A==
X-Forwarded-Encrypted: i=1; AKwUvBwA8xsZr2xiTGpgRZB6koGezfSH7sh8KviEwUfIr2r5fIBPMdKhjo8piQvK8AWLYksdITxVrw1S2ICSZB4=@vger.kernel.org
X-Gm-Message-State: AFuF++nWH0381oF+ifO2JSat+BDgP9aPq06mbGE1dYI9eGMiiMhuyDtg
	rYEyz5Iv98vMKnlyAVqn2xWbmJYW5oplBwn9MK2wwuAz+FFHhk++BDsKiqVjUNSlcxoh1A==
X-Gm-Gg: AYBFou0TShxmiuT0TdW+FmjD0dQzSeOPQf96bfpSuMC0UHsxdWlOgEUqTJkKEY8isHR
	eM0vfJWQz8Gmea4+IIarxwuO+4oCxVmUKT9gp/EDEH5uNXInFK60OuMoNECu5MLDNbKYdIlobhj
	1HClJADNMMPBNjHgVm2Jz21HDOcv6hSNFk5lKRt/MSyauLbw5bOYzdNrK+4rrwdUPzk+q2J2IRs
	X0iA6+14/zZpsunW/u78RWR3xjpVdcGJesM2zcMYdacBtbG9XPQ4wV9rZhHVgcOmMjjFP7R7UkV
	PHmyuDjyIQNexaZLpodlqpp8+DHhXGlKgfYo52wwXjwS+cDq6zLp1uBlD52xn9Dh07qRfBqr/m7
	h7e0h3sQne0olpo0aRiWORgLvmZe9/wrh7H5UvgNVpVgF39U+PV7d3hmzZOsiVlZK1l7GevAvya
	YWjozY9l7pLEoHpviqcjHICDNp6s2oRABViyNYR0xKmbBGEDA/9RvVPqUE+xffCQC0Hf2v0Vuxh
	hZv
X-Received: by 2002:a05:6512:128a:b0:5b6:10bc:b869 with SMTP id 2adb3069b0e04-5b6177bf69bmr2695515e87.23.1788753717151;
        Sun, 06 Sep 2026 21:01:57 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61669abd4sm2123344e87.5.2026.09.06.21.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:01:56 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw89: fix typos in comments, debug messages and struct field
Date: Mon,  7 Sep 2026 07:00:33 +0300
Message-ID: <20260907040138.4321-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <8094bfc474e34b2f826b9487e49bd601@realtek.com>
References: <20260904222548.19732-1-skokovmaksimevg@gmail.com> <8094bfc474e34b2f826b9487e49bd601@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>
>
> Add a tag like  Assisted-by: LLM codespell ?
>
> Just reply this mail, no need to resend v2.

Yes, thanks, that is the right tag and it matches the format documented in
Documentation/process/coding-assistants.rst.  Please add:

Assisted-by: LLM codespell

The note below the --- line can be dropped, since the tag now says the same
thing in the commit message.

Thanks for the review.

Maxim
