Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA95650E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998200; cv=pass; b=hl6ngUgF2aQTprGcVys3pr9f0T67cwUD0dryuUCpAhLXiQF31gzqtC7em3QcWUsCCvVUbovlXSP992dRRK2W9fgFpcx+O2VYNlkcOAZI9dTLJD/iuJ0id2+ydlpBI5XWbFcXWUJTQ6i1BE00GDNWd4LYk/nWMMK1I9WmLMFy/1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998200; c=relaxed/simple;
	bh=n+P8pdNJr8H9eqpeBOYRiQuM0p60+SoNiR2bMXH5/Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbNfItJNerpixEW/BOG8oAssf+cbhTVuJ2DGRH31xS2hFuE7qDheGf1gtK+rX0XYsspLC7itpFOCJuov4w1M07X+xQa6mepMUNrCszi9jHRFKtyRzFVWMhUTZoa2CIS5iDepafZF8P31Q3dxJKK23amW7Ug1RtkBMG5c0blwuds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3gXTShF; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3gXTShF"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91054f537ccso49498236d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791998195; cv=none;
        d=google.com; s=arc-20260327;
        b=gbt7kHPrfuXSwgMHC6HMZId2PjKSfL9b/Mjt9sGKzHJiwRFT1Gh/GqmWlvp3GbI+U3
         uIH6aiOzmtcLuzhbZJYqxgQBGfyCPPuW1Hfrweanvs03E2Zyf2sk55WqrX6tjax+7SBS
         M4nWKBLNvzmy+iHQcskENNPHE7MCYOxScu0Ifikq4g/k3qtMyZMiGi+2z4F+3moz7IhF
         NXlQVyC4UrnUrjEu/PMKk3pdGahl1JdtR9r02aMbVk5QJmsa/zDGmFTeXGj4BQq0Q65e
         JgGxstBbVyTBFXPkH/knhZT/L8HAfkpGW4geaDJwurmel5++GkHAixx3QkrmYJNx+xdt
         qx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wlg/8gEVBdbdfN7cd1lGPe9ZVLLaJOIvL7fxrk2fyow=;
        fh=MU6xbpKBDeY4G6A5PxpqwtNijIPKtFcEPeiqGnz68pM=;
        b=c4pXPtsqMhykRMyZrZZge5WS0KJloT3oBV3MHlOtxcyVhPeieHyacLPTWyZLbpeLeA
         aNx5a7Jj2haNhb2t/PvE2bN9GUDgD3LnhpWWYVamPTazqd5VHoEYkNad3kObrldzbuy6
         z5XZsXTlWA7RtrS801ekGDEHEW0MDVg2DRBBv1vu8cWw5SWS+B05Y52riWPZXLwZ3QZi
         coXhgFln3E3FEAx9fRoylRWmn+kSl4CmjWVE+vMVctvSJk4DSfMTZd7YhYNeBcH6YTiv
         +CkIjEmG5kqpibqQlRDxxB+1jb3F7+I+0NmNwsKkKZbbnPpYpPBcrJl9V+rqBWzMTmOQ
         3PPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791998195; x=1792602995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlg/8gEVBdbdfN7cd1lGPe9ZVLLaJOIvL7fxrk2fyow=;
        b=H3gXTShFT2OSkacagnG/JE5TmD7+8mWaNR04btyNiHnV7EIQA2W0LIcT7Z1v7E+e4i
         m+n1VKx0ydaeSxES6Rk4Nzxf6Y2LiENSxzjG/zD2Xv0BLUcotMRNnEl3cbLac5dDUqO9
         SjtfQg9ZJpchZJu5wfqdh5XLB8JFqaFXgvbnNWlMBSA8RV1tGOLctvtEKV+OXFHzUhRN
         nn/dMcH6jXeef2i5timAGb2qkbmxvaS7Se8MMXMk83BpX9qjeYM0T0TbLOcYialYMjwJ
         3zBSMWZPb/y4eJmlJ6fY1eCVsadTm3cJPUVpAnsh2Xuc5bVEe31K+foE4uA8s05zVjY2
         Xb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998195; x=1792602995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlg/8gEVBdbdfN7cd1lGPe9ZVLLaJOIvL7fxrk2fyow=;
        b=Eyby7shqguHe7rv84xcEoKkDMMS5FdA1hJ5f17E+mKn0fhtKYsQQfMCIts3sqW694l
         BnOz79A7l72c1Oga1MDB6YjS1804nHWKjWmg+RqZbcQFAJuM8x88qmHeoZmS6hMFTb9g
         9uSe0zAVswt7BSwjwKNjnWXMsGgfXrXIN9Z8DBq7pZI2fRWiux6N9QsZU8YBUp46jPe+
         eixFD87BiUt53NwnsVCyrH2+775/mjTVOBMtdh6AojC57lHcR74BzfSaJY7E5i5Sc46y
         pGhPX0eWWAQFT5a1XRiJptX+rPktW+HJc32epZGNAl/BqDB4gJGXnSoXVwMfhX9wKq6d
         SvMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzCTiUm/RCqnw6pQRTyjqJYAomN2Qn1CWU4+h0frPvT1LROvCBQEtRM6Wmtw5Gsc6AzFgV34OWJ4zpyDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbvMAzZVI/0LrVt6OA32jbh1j40TFQCYhhmoBTX9XM22PC51dn
	WUpO4AXBkIFpLOV0bcyYevWlp8ICPAlQkfXrVRCXIzpWUmztPQs6HPjlCFVPISKemwG4BzRYdfn
	x3CqMzYRnURqGfS6nr8T3XjVqd15MxF4=
X-Gm-Gg: AYBFou30Ch6VwvY+507uJ3Tn4gcLkc3ka3UenGKaHyVarruKW2giKpKx1QtyneOzwzt
	KJ/onDlSHl/8UfqIu1kuRnqrf/BUNJ6ZRb26rt2hykoByMEMvr6nY2vr8kWzvCd9th3SqqehivH
	5Z9aSKEx1Mk4DCyNgLUkA4TTiiW6wVwvQ2+67/nwNbAL+LhvQI1/AsmHd32R4ShinDeCa7sJwEf
	HnmLoq+uFH+6dcuP8yMKJueKJXNVPBg9HCnNSKa7wG6K8EN5tsAGo9QqdX/nwo6ZHgn5YzqbTY9
	Zshi2NWw/NwHYQU+qh6lumaansewg7EMYWHk7SydynYCf2TMREe1CmSF4swlie6/eQPMmU+M1yV
	doqcI5PYLGJKmNpU/ZEReJFGmL8NI0jQaZTbAUepO6GcVcdTJqr8BDcFd6k6XPB9NQd4t
X-Received: by 2002:a05:6214:21ed:b0:914:15ce:ed88 with SMTP id
 6a1803df08f44-91b55310e0amr276240526d6.3.1791998194886; Wed, 14 Oct 2026
 10:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791933697.git.lucasadramalho@gmail.com> <ee88fc5b7ff27dd1325b8a80414615d300b1558d.1791933697.git.lucasadramalho@gmail.com>
In-Reply-To: <ee88fc5b7ff27dd1325b8a80414615d300b1558d.1791933697.git.lucasadramalho@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 14 Oct 2026 14:16:23 -0300
X-Gm-Features: AclHuK_YabWgvVn1tya9tDw8zLhW66tU6kX4gs20bjAwBzgAQPFsSDGlNH933TQ
Message-ID: <CAMAsx6cEyoHkYOS0_M-NuqN0mxswKdpbzktffPxDhikV_w3cDg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] docs: translations: pt_BR: Translate stable-kernel-rules.rst
To: Lucas Adryell Ramalho <lucasadramalho@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 13 de out. de 2026 =C3=A0s 20:46, Lucas Adryell Ramalho
<lucasadramalho@gmail.com> escreveu:
>
> +- Deve seguir as regras de
> +  :ref:`Documentation/translations/pt_BR/process/submitting-patches.rst
> +  <submittingpatches>`.
>
>
> +   Corre=C3=A7=C3=B5es de seguran=C3=A7a n=C3=A3o devem ser tratadas exc=
lusivamente pelo
> +   processo de revis=C3=A3o -stable; devem seguir os procedimentos em
> +   :ref:`Documentation/translations/pt_BR/process/security-bugs.rst
> +   <securitybugs>`.
> +

 Because Sphinx labels are global across the whole documentation tree,
`<submittingpatches>` and `<securitybugs>` link to the original
English
  documentation.

    The translated Portuguese documents already define their own
labels using the `pt_BR_` prefix. Could you please update both to:

    - `<pt_BR_submittingpatches>`
    - `<pt_BR_securitybugs>`

    Please send a v2 with this change so we can get it applied.
