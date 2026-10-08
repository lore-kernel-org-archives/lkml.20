Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640238655E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494917; cv=pass; b=MjHxYK/4znCYYmerWnPx0R7bHIc4sRfP2ZZZ/Sxt9ZVADbz4EUbc/mA7ZYdyiwqVCvQI+b2D8ev+HcTLpNK2IJBtBt0z+MFKtgS9zJBuE4RR6mmuduZlE3Fq0kVnHRXtoAXX+i6IU5N+FygyiQ0fZILWUnI/SfFcN2RROqFAYAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494917; c=relaxed/simple;
	bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GlH44OfYGGUaX2roPNecBVdlljJi498uOgCdC/rWvkq4/261Rlg9PjJywq7fRYvaScEWfdH4+ZYYVjNFFmNwTpMesRQrAj7A3+YBB10tCSW3zseseud+23UV5Y2pTc9Jih9R7Q//dDi5qA7cDCviBTp91akAGSAZf3XF/yXqfdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd5kijtB; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd5kijtB"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e64d52949so327076085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:28:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791494915; cv=none;
        d=google.com; s=arc-20260327;
        b=GSaumXSv2m6M2lm2HZsOOnxJKl/4pLWQ2iTC3SAvHGE0ifHdU2nZ5+Y/e0KcZYN5Qm
         Wn6wXtcrlGC4Y2E1gKgOit1F//L3zgjH3G40cQkTgaXkNv1rAXlxdJ6wmkFB3QoWUREy
         xXnwo3+0VgSGVEYUBN8TZJwm7I8NF4Qpm+gQBoAW+KSIEGQGItkD2kIliCywuntjIvgT
         6XMg2fcjUiviCJm3AlPhC584j1KGoWiG00hBZrDRSOOO74cx4MkxjM+0F+sPn54kapEA
         9jIBW1bXUwiLSuBzHkDeaV/2jgxvZ5vAk2A6RHB8ue4nCYXjFj3EhoPm8EqHZ3GA5k1Y
         5eCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
        fh=RN7coBH7gH7EIWtA/wIcKtBYako1hRvEZ9wzh5N4gSY=;
        b=FrH1lXPeSp8nxzSfeL4aOo3dlpl6M3jBTf1iF9mfnVbciEUh988JKTbQmLrvHNGgZo
         uNU8Y+PwdjYLlorvHs+5gkl2LsQSEhOX1Spae3/YVfVTiwtvWqzKYGWyDq2wmEg2/1E/
         iGD+5K7skutSAVuBxXZ4CeJTUmLuxgv4RQjgNWQtWBuaYFzdncJVed/8rqUHLqYA56fn
         LAL9BeuOiJWC50cHkjQYuHJ3VDdtXdTv2IjIUFRyK44rRklle/H9hLS236cWyRjePMNc
         xzcmbxKJ9OsZSn8HHS+DD7ib3XmMBkaqVCzCH7KCXhyTNgKrO+dYIpmnfxXP0Xn0XQTc
         D2TA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791494915; x=1792099715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
        b=Bd5kijtBRJHLwxAG6RdRDj2aCF/qwobpb7etpgOExy87iOCEFJN6XgJGNAi+N4S6qI
         6ATQFsnpbCCiWCtR8eM+kVxkdlk9t2TJvDEw76pehYfVHCXZDxxf/TvRJCzUF4c4Ssd5
         dPsAqG+pEssVhnRjWnad6ZKfyy+46GUHT+ULnFi5YZML07S+KukpdCTKFJNKsQ4NlZNj
         pUQKcJY6H1AqyZ2vXVdZDQL+kbqiT9LsIA2juNyLWYk9YDlyuxTy52e1aVTkJ+33eovD
         htM4vEjJR11FwMa6lN5vCNnCO1tcjEv6KZV/vkuCZYiI/M+5TuETWZM8SnVrX8zsco/v
         7/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494915; x=1792099715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hw71EnNIbbz++xqDviTBnAlWqT5921Me/DS4ajh3QtM=;
        b=Df09+havLRJPVwhkU40cgUZljKb4MihX1sML9YNIfYUJFp54VoLBhZzrmIdTasnDkj
         SmRGcNuWLSeS/OsAYUthmIR4IErN6XXKjAhKdY6jwQVITwEO6QfS17ERSGqySItyc/2b
         a1sJaPRjB7LpdHAJLzo5IYv3GHx71ugrDm/ui86onOrotFFiHuLKL6leLRvwxM33EKi+
         ZJtHMZfU9R6UjXkJIuIpbxuu238EHh1P0NHE1+se5Ej2ZIHMlqggTqh13CxFZ7cloXO5
         1YF/t8FANc+sH/VcPWlqE+FlIo1sivp/nIjJgW5tgB3KV7aAOiYBx+3GirCAoPy/UYVE
         j8oA==
X-Forwarded-Encrypted: i=1; AKwUvBxwqrjaKSNo9vlXyYrrxVR9QXQjPjXj+R0bnwersGQ33Xg43aJEF32QkTgRukw25VFZsizs2NURvJ89f6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nvKBe2CBo+U/yrm9wHf1AekqQtrE1Xr4XpEbmMcJwRre9kWsbA
	xeKmS6JJ9Yj14yYw9PW1n655wo52nfKG/hGDq/p34KxeQCCTCfy8UovysvCOouYHkGSK5mCF7Pw
	pkWlKcy/oaPL5S/mXL4QPCrT2xlEPLIg=
X-Gm-Gg: AYBFou2bkExwwO2KH1+KqXcqAZ/RPnF2HkGfIHFsSXci5tM6GyS/+rk3q3NQUkilrH5
	56Rq90C+diszzZ6aXIVpB3TCPlCWXqLjwgu30C7BvliIEUTgx9xtQqq5iBt+X9OdqMrNRsO0ilF
	umpyDyeE3aBBPTKhLxekkWIWMvKGg7pw2Ap9dJUno3xqdISeFa19H4rMQtNSi1g0uzPBHKbhEjA
	9/iRDgJFO+M4m57csl+xZcsC+hWAxGRdsYp+GrTXxTXi0Ym2l6BxYUMxCgW1X+hMdCc49mu7PEj
	cGBBQFHL0ANuLKReQonjx7ikTRPFCScmnGtcQrtzu1tGJThS97a4F1lwCL8ePUHeb80coFIwCAB
	2ebfm9U62Ts1Q5fgOy6v1dngl
X-Received: by 2002:a05:620a:2844:b0:93c:612e:9b57 with SMTP id
 af79cd13be357-93e9b84f3a4mr1267578585a.56.1791494915507; Thu, 08 Oct 2026
 14:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074903.862898-1-linmag7@gmail.com> <20260923074903.862898-4-linmag7@gmail.com>
In-Reply-To: <20260923074903.862898-4-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 8 Oct 2026 17:28:11 -0400
X-Gm-Features: AclHuK9egL7OGGTcAjait5dUGNk7qK_dDOKjCh1w7fS59DRwMwvQhD3rT6J8mjc
Message-ID: <CAEdQ38G4G6QyYScfDGuAFvzjyzOXrd=2K-gQM+ob8EMsWUkD=Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] alpha: fix the local TLB invalidate in flush_tlb_page()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2026 at 09:47:46AM +0200, Magnus Lindholm wrote:
> Test current->mm instead. The calling CPU then has no local invalidate
> at all when the mm is only lazily borrowed; the next patch adds it.

Please swap this with 4/7. The else branch is correct on its own, since
it only covers mm != active_mm until this patch widens it. In the
current order a bisect that lands here has a lazy caller doing nothing
locally, which is worse than before on a machine where the tbi()
against the wrong ASN happens to work, as it appears to on EV7.
