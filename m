Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247151;
	b=wsjarhROCVWGovvJj2ZxTO67UzGd5WBEtNy175b68gkdRLEj0w4fB5ir8ocW7mXV7+1K
	 C8CsWDtMg7dROWrvzGertqEE4XttFPace2mfZqnZBSWCHobUhgiW8E7j5q7QwJZlkyBSv
	 jGcGerAOwim9y0IjZ2CXL0Jmnr9Jk5Mc4PaczpyUrOY9s7d3kPAOPZGVEQ4TKgifszqQG
	 x8SQNFnl22zIlPwn7YlAdjlVxekvSEWQgbLQqaC5WqFtSeZ0vc923GUjDxQRvwujb/5zA
	 AMNTbeVkdXPQO3RsdduOW4n4/bYNek1bEs3JE/YwsgPATJXDtJ01ifhjvU3fr9Ow48Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z/ZNHj0Rn68UKNmdBxxUTiUBJqPFSpfv4f03+17ya94=;
	b=Ag1/zWpfwA1UMmkNU8w7W8Zth3nKkeb8msQbyirgRKGSc4Y/v/ZcFj1mKWk3Dx0fUxFZ
	 v1EM3g1BYCvz6O7xk8KG3Xjds59r5G6Cx7YNGHIscy3I7xi22nUHaEVddG9JF8goHLpbk
	 BOTV/sbGs3mSbNcprMNmfkc9pcjBV7KDhnh7gsZKlGuHeQg3Kz/SPfKGbeTNOkrYsnSIu
	 RB/K4I+hQfKX8NVqC8P7PqpuzcGBvlHZVEZKJ7crbyDEEuEyjYLAVuxquTaiTV3cuXM1X
	 izi1w68RgPuPUTKSOj4IB1nIksATnANf0psmA49lmoUFde295Mi+8bV5NrI3glj3SuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIo4bkEN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF34606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DF34606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIo4bkEN
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1402231d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794247149; cv=none;
        d=google.com; s=arc-20260327;
        b=l0MwyAdGfFkcPHFmS4m0RHked4rSbytt8katZjIiovRUg6/6alGrgkAvXHKuVJCU3Z
         b2MUxZh/B5JraIozXrIZWe+KftJ51cBxgGGwVg/YhDkHdfEHAUDp7C3EYR0DgT1rcAKs
         Ldl+7vVI6W2ubjdFMJLs0HfDQopv66Lk/RzGhrade3G75kIdJklVflaBZb7yWbyD+aoQ
         NPtjJUSck++d5HC25DtU0E+r82Hl4vsiLsr9uR7TLMgi6BDSqEgWeipL4x5FCY/U5bNT
         lVDmBNrFvUi+dhfch9jTwlopWXxnfyaRaPQGHWxmvu7NCi6s7C+xYO1x0FfxVkYVk7eu
         02HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z/ZNHj0Rn68UKNmdBxxUTiUBJqPFSpfv4f03+17ya94=;
        fh=U7J9MrpWA05iR1kmMzAL2Bml/Fd3TRcli4XjnixZrHo=;
        b=sprqi9uc6pcMMFMr5cm/OjC4ZBZcBLiZlfcNge6TtIeuuD7Z6oXGZi2QA6bfYZm19G
         dc/i2oBhUj7XS2BsQAg5n9IhdZc55ktRBW5k1DCTCgFxi4o3cl8bpy6wU8esVK8K3Mc+
         bDV108KCMlQqmqqDCTj8pQfXA4MqQJ5HIqKanLI0SrqEIqtszDForbkmzYF9ZpZl/xRs
         CMvYAivuygVbaLHrT5GDWKreMH75P1t6NNTC0cVyV+WBZbk4G0xBD+oRJf1Jq63JbngE
         NQqsaVCmTGDEocJad+R+2xMa+qZ/hu+KpRC6b5ndE6BtjFBnSXs8YHWwnGJW7AgB0BHY
         UDGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794247149; x=1794851949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z/ZNHj0Rn68UKNmdBxxUTiUBJqPFSpfv4f03+17ya94=;
        b=AIo4bkENCltLwdrhDOZewdicQonBGCTBeQaFNVBEliAS7m9/i3hKneycQdveLgr8ZM
         FEekiHI3WHCXhSHf/ycI2V4XlVTWenynjHLnoJsebDlk/YEP8paOC+Aed4lBOWTEPKhG
         P8yo8WRqPR8B6G+3WkngiNWDTOA96V1IsaJw/DAbLam/H8VXhlJq0WnVhf1Z/Tw6LzS5
         vk51tVv1X+KkoG8qSPwMEy0ZcIR51QFt7/I51IiJeH1cZjmX6R8oa82Dq6sXSAKMgAs2
         vYS8ymODLfSHrABA0Exg7U5dcGeXxvulRyUb5vjjqNu8VEHI+BOCfkfVA9fqubYvAQZZ
         uA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247149; x=1794851949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z/ZNHj0Rn68UKNmdBxxUTiUBJqPFSpfv4f03+17ya94=;
        b=NmMUUKygX8MyIz+uYhaIU/AmvBFYCQdV8grXLX1fXMB+AHBF6ow7p2CwRmAkQiRGDm
         X8X4/p27j+08jmgjXQq9Q9+JPeppZuxwdwFUHzfMXJR7vqSxlfSW3icKiP1BqKG9yOfW
         myeldj22e5jZ026jCrhI7O8Tps/Nn1GcyO3dDlV6VII/jkx/uOL4cUiK+XzW1b4C+63g
         2YmmZ1OL7TtQeZznn1FbC0DGMhopRgWZexTPw5W8D3FzT9jC95UWq0JVYnXqUIzQUvTX
         AAZwZXoIpMebFKFq0JkPlc0zx1oZ/slClvfNkqJu3apZ7YzKtbknsx36SM88J412h+IQ
         N4lw==
X-Forwarded-Encrypted: i=1; AL+hErFhszEs1IyiYPCof8eZib3in8iCjSSdzDTiP4saabq9IZTgeNG/p4I7Pb7Ud8GHVv6aUR2MVhkdJa8EduQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qrPxb7UBPd+qYSx3ttDlow0WB+OKE1xgkWrySKEKFKFOkMEG5
	Sx/OiApK7Yj9O81+sVFmM7gp3wuE14YHMlemdjBxTbPXYn2au+e8DjGaEkrSjAMLLot0V906qrf
	fJgxZ5MNmq9WGFlPNMg7DnXT8yBKGydg=
X-Gm-Gg: AYBFou1u0hrtC968fQdJ+GZEDbaOxdJouzTgx/T9TjqYzND+BW4xJQstTS9JHOcmuHh
	UIFVVmpkMzBeVablvGI5KWF71im7qM3uYfqSHrsvxbaSAooXfqYOGbCiCLgsXz6lO2eVbnGjTU9
	09RbThxEJsJJoFjv0fdMJ5n+xt8NCVMFI28yZrC4cEXsvl3YjPtr7Q3AvJS43U3s86gTDhxOXeP
	k4l2GJwjNCLVh/VwG+baa9kZ+KzK7KWG4nCXvASACtUPKlYXtFIiKROH9bB7z0gQG7SxhvdxHUh
	Ulyk5pOWonK1b01DFaShPuPs5Kf4uu1W4DuZSdLZjOMBRpUsBZmstIjB++IQo3YDL8CxgUi/K79
	cRj672RxtYHQAOSFyCtIHTRJNap5YWAHo+IH1ngX0XksV3QoN8xjCMCFHZ9P4u/+d7vpvlmyXLI
	DBz20pRX/l+TalkEFw6xkEK6A8+0nYiR/11drquF/9RgB6WFYpGGh3tbb4Bw==
X-Received: by 2002:a05:690e:138c:b0:679:fa54:1ea6 with SMTP id
 956f58d0204a3-67c56830448mr223512d50.88.1794247146395; Mon, 09 Nov 2026
 09:59:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109165939.138448-1-mdshahid03@gmail.com>
In-Reply-To: <20261109165939.138448-1-mdshahid03@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 9 Nov 2026 12:58:55 -0500
X-Gm-Features: AclHuK9ejIQT6HgBplyFvbZQHs5s3CbaGps3p33veN7nSZEUOaWjdoafe_Z68xc
Message-ID: <CAEjxPJ6DApZN+Ri=9dZ6Ff4d-aegQzVKpTT04EtgOaJtdjy8Yg@mail.gmail.com>
Subject: Re: [PATCH] selinux: fix potential use-after-free in sel_netif_flush()
To: mdshahid03@gmail.com
Cc: Paul Moore <paul@paul-moore.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 12:00=E2=80=AFPM <mdshahid03@gmail.com> wrote:
>
> From: Mohammad Shahid <mdshahid03@gmail.com>
>
> sel_netif_flush() use list_for_each_entry() while deleting
> entries from the network interface list.
>
> Use list_for_each_entry_safe() to save the next entry before
> deleting the current one and avoid accessing freed memory.
>
> The issue is reported by smatch as potential use-after-free.
>
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>

This isn't actually necessary AFAICT - sel_netif_destroy() preserves
the forward link with list_del_rcu() and defers reclamation with
kfree_rcu(). The loop holds spin_lock_bh() throughout, so the current
entry remains alive through the iterator increment.
