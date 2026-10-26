Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010583;
	b=I2KHZVyGHKXLXzfK3B2FGKgr+Tp90bUyLuquWPjgOK82Ir4idI2sI+5taD+qlkpWmALf
	 zm4p7PQU6zL+LK9uk5BOPTbu6YRB8ML6ZJH6ygW1FkRwXuHMcqNwNN/V3+tNtExfF1nQ9
	 D3pv9WOg2dLmYDXOPFvibwHJ9MIET2gMKVk6Emr9B5WFt1xKd81LD6BGDwDSb+eLgYdtM
	 y1zPUonhCgvKd8V+wK45jMHrIeVD7zOT5J5jenEdvZUjxCiseqnbZSxRjYuhc2KgqmE0I
	 zpG4sNxW8REmy7IhB2qDkae0zQPFaysy01xHigOM6U1dFpkWRhMrotsPJht2UmFx2VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VZ9A0GT7Bc+iwj4opPu/rDKXsQb5fk01pBmT0V91WnI=;
	b=sDwQEy7HToz1QcJK9UH6+yU/2S7JsZBH0Iy8+go+fuTNE6LzJVBMg2mQmPvrOj7j27uO
	 Coi1Ci/6cTIwGRwQvYLzx4LQqfUunpAMgLm0xjTHqfEkTIBgnU69NA+k1jPpitFTmU7Di
	 20TnZNtG6GtlSAnPo7kVRKQt4ga60d+vzw9xEutt8JJKUiRyhsIrrOqTcTXZSMFzcUrlV
	 195CcdRhB1T6CzQqnpevqrDvOlgzQJdOkeg8OiBAS9W8lgVud6vFsOIv1TSMXXfGO83wP
	 tYtUePzz8MkVeBmcT4gYGd68DBnwCt+LrpqPVSGWqhcbgiOJYihuMq/CEU2nfz46r/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PdrmcN0W;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A695606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A695606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PdrmcN0W
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32448155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010582; x=1793615382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VZ9A0GT7Bc+iwj4opPu/rDKXsQb5fk01pBmT0V91WnI=;
        b=PdrmcN0WTGsFVolzHZ392hO9v+sbKQEarF5LDGgdSCfl1Mnk3HTCbBcmw3ocRbUXFp
         RBjDtplnRz+ctu5MOh+fafaSdUcglxOuwax6df3yrUKzB5IINuKRFIsYfl6uhRuE5nrz
         2SxPcLQ3NXBEKxtfWcHUmRlXUDGc1+aJEKZLL0I2rlhFh8D4fyTsfycDwOYk7BzYrkvX
         dzt5pXOjLFpMl9Uo7Wv11mUNPwInUjyRq4dt9bT5lo5VFYVgxd6ERtdDSSYDofTrLCNv
         fZud7/auDjLBvOML1H3KUS+7gO9q33Sl9POKJs65ekauJLljdWyItJvt3jblJhwhdOJt
         tLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010582; x=1793615382;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ9A0GT7Bc+iwj4opPu/rDKXsQb5fk01pBmT0V91WnI=;
        b=aONc2RSIZM+bN1BEhsBFhigSsRKpDv+Z88wreTTNdgdICWUll9TRGE3Jobhj1CM3cT
         G7kAMi2NFF1PFDT0NTwNbcDYpnOYfJ5VgvlWnkwlw6TdtvGA5JsMF5/uSbYAYCsMcN5A
         LZy7D0cqMYGHOKV2tAkRJREAOtBXGeZH/p58nlKVkJBwax15KJT8uDGsTQUCJ0uy+oE6
         hPxKjt6owULOLMez8UEofR+BbUUBvAzVUleL9V0yF05AMi8cr05LitiGYaljdtRp6Bdz
         mKFNFMszmt7lQ2iYw41Aq/v1rnBxT4CVth/ppffkKd57swaQFbRzXEWemQKDp7fhSV5J
         vU2g==
X-Forwarded-Encrypted: i=1; AKwUvByBuQPTfzZMv4hZj915Z6RXgOdOndbAzhaQmLACJiVMh2BxtYOWRK8Mn1XSs2t8Pj/qIyrnghk1Mbm5fdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp6IUCXNRz672VsDmWpj+1J+jnXeDj32V+2Mo2r1PAetBoklDi
	uKU57IJacQjIW/MQxE4eHyQEiBmDRaaD5qzZko4LxSpLKwwpGrt/vW3G
X-Gm-Gg: AYBFou0Ct71QxgkvMRN6JdxeZu7ohET9rtmHLZTtd9L9IZRu7tDfI9BGwpxA/v+aYQp
	vhyaqiwcNq3367kpi3ixRLHi2OuZ8AXoSIC1MjzjIlQV6x1OvKT27fMzzi8du/TMQBqnlMh1TmR
	i9fXqgnPMIPB6yQr2oEyiu0hHCvy+5DgOdZMtzDnu8Lc3gqPZ9JeBEJTUCKSe1rulsmss5Q75Gu
	YcBev4V9e5HI0k6eFGEi4IGAxgZVitJDYr+biKLtf6Vwbh+gQ9NqpjiZToYw5Wxe/WrnrbpgUEm
	aKtuW/Yc+wXa90TqQ01hGItKzMYXCgu1/S9E1EKhcy7JAq4ombXHv29Wvceu/gHxxnuJGFKcx1A
	lRnu5NizeVsOU1QWyIJn9JqkD2K7Am/QPQS8jXlalS7vMi7xTUaYiFb175gD1MzU0xduBQUlqjs
	KiSD121KFBjMuj8V4OcELQsahdcZ3vDRYO7ol5QozFq1UiXDkp9gqE1ZlakQatOESezI6/0Ms0x
	cetPyx21plP9QAzY2ujrOOFQlxPFkj4iKmznS9ityXeqV2tD3Zqay7kiz4LrGenV6qdFSkWeA==
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr100451485e9.12.1793010581925;
        Mon, 26 Oct 2026 03:29:41 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f4f20dsm129772185e9.0.2026.10.26.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:29:41 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:29:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
Message-ID: <at8rkdbWrz6uei6K@stanley.mountain>
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
 <at8lztOr7xpvHEdo@stanley.mountain>
 <CAGLmz9KAs7oKnmLv8NK6Z8yBQyrdV41oiouoRrNBY-j-p_H2+g@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGLmz9KAs7oKnmLv8NK6Z8yBQyrdV41oiouoRrNBY-j-p_H2+g@mail.gmail.com>

On Mon, Oct 26, 2026 at 03:52:43PM +0530, Himanshu Bakshi wrote:
> Hi Dan,
> 
> Thanks for letting me know. I have already
> sent the v3 patch, so I apologize for not waiting for
> a day. I will keep it in mind.

Thanks.

regards,
dan carpenter

