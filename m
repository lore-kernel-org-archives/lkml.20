Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D342F43FD06
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594121; cv=pass; b=OtD0kB1uzwfAOG9YA55aJRNhNBkWfSIKFwH6TjiEl13o5R3e4bevh+4h21lTnHQuJEgwDAZ0MzhuuikGjy5Asvg2hd7DJRSPwxevrKHsTs689RR50KF1F4Smefwm1bO9s1I7n9u2qmKJqrpgC8tfSCkf+JjwOsSHLprsnZeZs0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594121; c=relaxed/simple;
	bh=996CJFGuNyyYmh+etTTKX/Yy7liiXJyv4mmrH7M/AkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRiE6BV0cMJ+xSL8Akjjvwcgr2zV5Dee6XIWx0AC/5KOMMWCm2y8n4JlpdV+etQxS3YITYPF/8R36zRBXfx/Xt7vdg9MblHpd15fEqblxLMU8VFUsMnPHWXYUbP6ptE1Bf3bDOArSqKE49ZzPY23jU5VwAu66IFf3BkcLBWY4lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsr3Y6Rh; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsr3Y6Rh"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso2272558e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790594117; cv=none;
        d=google.com; s=arc-20260327;
        b=APU46yVvKR6gTv7DBQlvMCGzhMQqrZKj0bTbKuciaJWBpWLW5OWdQPua6GbWVMtIWE
         XPzNeySNA3TsuKhpPGCFx0Z+9OzLmiK+XnlSJLj+W2PFaP5J0A7fUT6e3yE6BkLnfb0u
         qJgAO5/MSP0r5cRbmIk7sduJxT5WWJ5hWbFiIQc3oysFbN8+oXmallfPG6pTPwajC5RK
         2tQ+mZzuaZ2Cgf8TLqQIT9XmFSt70pFdk5tEbN1J7/25ITlsvNsHtfAQc1tUtcVtwXub
         c4PV3sVz8MTTqb+UK+qWwRIJDnmtlw5jLULIKsm2Sh50iB3AKRn1Pr7e+w/jDh+e6LYs
         sa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f5LqEIqTiSCGzIitZ1w2oEpzfNZEyI+MHlv8nCt0Pvc=;
        fh=prjCyriEp2yE+PKXzmsbcDRN4y52S4W1qysJsUZniUQ=;
        b=Gi/Q8N1Wz7oU4O0Ukm3QPYQVMMAZUTw7p/hr3mUDbzkdcChgc9eH6pqWCCAnXzzP9a
         HtmHOQCpbn1+L56/U+23vKO3GIyNJ4KFyUwlRCUZ3yvTKxbP3aMCEIGCZwmnZn21qeMC
         9Gs4OpoKpZOrLF+5NouMEFD2jwcdORzU/Uk/VH5efZdXBOzF/0oGen5sA4+GZWWVuWGs
         wIez4g1+LinL5OrkJpxiZZkwH26R8IYf7CDAy6MOv9qL5NnkkRrWoxxtUODKhrtjK9ba
         yFNUFPDytdqKoSM5AF585VTWESx9TKIydibMy4IVhUkjSslAyKuGKVfMGkj5HXBCHDXa
         2KSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594117; x=1791198917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5LqEIqTiSCGzIitZ1w2oEpzfNZEyI+MHlv8nCt0Pvc=;
        b=dsr3Y6RhGt5ckmJWs18u/WIlDPBUOG+qdLYQlzy/Tuxl5qPDtGrxaFVPme/xMH1Sz3
         /QJgssQakPA+CwyHRgfG+koUgrgGZ30gkzYKnGGSx5FCu30vd4+gsiPZrKCenSEwpht4
         CdBXU9uMXMe5vS4So656J1/Ej5VS1pg+TBujLVgQqcWhjtvKAzKLtgXVblofHzNdO38x
         tOTcNn+9AYCB4KiHUaayJVqNWX5mNK9tKgqzqYbf13wTQjogkaoCRJlppidUHSNge2ub
         w5ybfg7jng3cq3AOhQmeCRvrhy6nDYwlFHadSf1ldsL/uUKU+jPzfWtR39nOH4r8jH5n
         7fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594117; x=1791198917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f5LqEIqTiSCGzIitZ1w2oEpzfNZEyI+MHlv8nCt0Pvc=;
        b=Q7xeZjSYwMu3M15Is+iMF35WhMsExdyUU3oDf05Cgw+J5N/oEc4rEAKu/dnDFLJ0zU
         7vqWEcCebrlIVmC6K0LQ+pWBhHuaL1q0wYrtAsNZfdNEYMg08rY6lFxLy6M5+7bY9Hyq
         ESLhpbPulEpCVqEs0xIUubMWeo0UAPgCcI/9dDXuOOX6DSmFvy+LMXmKZ80b45ncH27m
         Ceszl39rNd0ifr+Wbx5ad8ZCnEczjf4DXWP95Rn73pbQphv9/BXBsBpAoA8ZicT7xAh/
         hiDURoBWRYJFsk6DIuSF5MsFWfsU7iWH4Sswg3HrMLCVzj24qGKPLQyYBNsEPv5+jbsA
         p2tg==
X-Forwarded-Encrypted: i=1; AKwUvBxNu5f3i8wYN+Qzd8S2vDcNqhHOFVr+IiyGP80+ohSIMQNpYrsUB998D9IesOOoo81tC8Za54hxCF2ifsg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6/W1tsHQwrQ+VL3JDqJirL9xsoGJTG75cINFBUnD8IkZrcf2b
	XtPmQDZm+E8OV8zisbAbTz6VlWjqkCnJb5vCetxbtLIpDqvN85+vPX3mw8IiAxz4pXfmLr4hXeD
	ORDBcuJD0JM6teu++z8WcSDGV/OJaCss=
X-Gm-Gg: AYBFou0r5E8cHV97Ib3OlvvLxM05Lq6f+3sRzC03Dw8skzZ/9/yYO+A8oPXYWldziYN
	QN8tgzVL+F14efhASQKtlz72LyZLcFLAiMCLwKbfO3kFCn+8BZwdmU0DHU+BEYEYEXmv4kaaPQN
	1yi/n9eDmZMWFZyAPURewf6+S3hPjsFvgxueM7RbIyN9vrJRudfPKkhwXSn3ci25bDmS9mrxBv1
	66mDFhw76h9j9fJpfgU3tOIs29fqDLebry4sreuxTSOjVqCWylHk47r3vf9TVutsP5BGq/4oY5L
	omaeWpH51saTdRuy4patHzBJu5paMEalS8/1UU4HDII0aljEySEu8YW4yJLxF4gIV1uvjOzToZJ
	n7m8Z9fVT8bKZSIsDsstmSLKJo5ALulSpqFdXO+KUlQ==
X-Received: by 2002:a05:6512:acb:b0:5b8:f0c6:1fc9 with SMTP id
 2adb3069b0e04-5b8f0c61fd6mr2364641e87.31.1790594116310; Mon, 28 Sep 2026
 04:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927002427.4519-1-sigefriedhyy@gmail.com> <20260927002427.4519-3-sigefriedhyy@gmail.com>
 <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com>
In-Reply-To: <cd00e6e7-aa2d-4f98-8a79-083b64b3376a@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Mon, 28 Sep 2026 20:15:07 +0900
X-Gm-Features: AclHuK9zsH1UrBsZg6xhnYP09aN47Nn_F68KRxkDz53E_55Atdfu33i4Naok4Ag
Message-ID: <CA+7S2v+kVVANjV4y5+YUBiRPcOfqhTXDxd8czaOY_cYYJYzfAQ@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If another version is needed, you can rename counter to _counter to highlight
> that the helpers should be used.
> static void __hw_addr_count_add(struct netdev_hw_addr_list *list, int value)
> Renaming  struct netdev_hw_addr_list->count to _count would help to check all
> users and highlight that modifying _count should be done with helpers.

Thanks, those suggestions make sense. I will adjust these in v9 if
another version is needed.
