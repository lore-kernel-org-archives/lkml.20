Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210932;
	b=g9WP7T5l6gXFjPC7fbMi8/7RYqaTuPL2AIrXSaoReN66OyYJKtU8RiYzH3qSE7auXpGE
	 TRmRkgIo5NwBa63u4+Ywf5p+oXX7arGDKdSBee04iBVo6WuIMsZHNkZjcp133F0/t60oL
	 LzbUS9YABKFtiCTdG1WO4jjPuDmZguy4EJpx8d6V8+LiuJTfLMePv7R2gYdIHygfkMpW3
	 WPWiubLHVkPoCfuWUjv9l7OvKK7XBtM6bSXwJ+mGYhLW2h/CdtSc49LV3ZnUmQ2W/GJyC
	 IQOboEi842ASKnGgxuHBZtv1W43nkfi5cULiu7hIsL5GxOgNTTuB8PJCXu3nLlLJYhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210932;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=jDbU7w6uEe89phDhaMwHcxYRzgCJv3Al9f7qd8GX1E0=;
	b=xqs8vSQwUYDibseSx04HZi8kVrmXMvcltTq/ld/EQj4aGTDoqvc5gUOMjYKm6W+ZiUHB
	 irxLCYM74rtFqYHz1gHOupsPUejIbdiPLRuIoWp7tOE0BYMIDmtHfCTdhdJoiRyp+Nm97
	 oeHyBg0mylliuedb0ZzE9sm1G4RWtdGR8fCCi8kMVaK/uhebU/0okLwZjJAOG2vkWEBTs
	 HmchOeu6KW32lDNTfTccsYtTSroq+7LF4DJoCjj3mx3qbxT8DSMny4YTTt97SwTD0Z7Ka
	 n/hYLoJn+2MnKXzoUNY2Pg/+jrIi0tsGyc5yVq4YxBajVC629GyjKzXD/GviOlAz0/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YEGiw3LN;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AwgoYVwR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBAF606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YEGiw3LN;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=AwgoYVwR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794210930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDbU7w6uEe89phDhaMwHcxYRzgCJv3Al9f7qd8GX1E0=;
	b=YEGiw3LNYnEDRNOog8r+AFBmSjXRLKNjwP28cTnnUuslvqT7k5SSJtJ9jknBcUYlK40Ph3
	oh1N2z5WvmzXJqmPDnRYF6OhZUr4XT6Op2Ic41UbvK45a+xc6i+/Ulh2C9bUqeTS/ssFQW
	9uDDl69haUIwXl/d9mgvt3vIe9NXpXc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-Bu9x9MERNrurhKsPgEPo_w-1; Mon, 09 Nov 2026 02:55:27 -0500
X-MC-Unique: Bu9x9MERNrurhKsPgEPo_w-1
X-Mimecast-MFC-AGG-ID: Bu9x9MERNrurhKsPgEPo_w_1794210926
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-49034831bb3so562957f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210926; cv=none;
        d=google.com; s=arc-20260327;
        b=AORZKCVPDOTcC+rHyaZdHO8qmSNc9jyJh1tlmB++SPUj0ZRyu140z+nIAo+iM/yvk5
         BPE+7LLWoTJngAb0XklVkU3ELJwvprtKZK9EN2XGi9BBrQaoK2savO5gGJweIiaBqiRw
         A7U35GVz8B3OfxAXSpyHfmx5Ulf/+jmHBSpjZMqZRgdQZ86WItVDBU58CUzECCvotfwb
         d0JcgRzXuF1gYPPEnuOat5yUat8JfL5D7kdsShikJ+K1tbPP8AUBmmzidqI/G92nSyIl
         4E1lBDAELlaiFZlLCNjy2K6nPacXPKaP7ZiOAhwJEoDdHtSRRxXQocCPQx+3zWiaulvA
         Ax0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jDbU7w6uEe89phDhaMwHcxYRzgCJv3Al9f7qd8GX1E0=;
        fh=fwHxT7Kr2yc23Rul2dqsfso2iv5pTtV/qJTkN7wDTjQ=;
        b=aisUrocoyd2fJgXH2EirtX1NrINmigiaAhCeBwreU0RtS5R5FMXxxPMe4XjUGfZyD9
         er8APOFHAeMcYsm9a5UC87UStJsv8VcJM9MhgbvhIqj1z2RpcnIDbN3VbVuYkuSHX+FU
         ThbmCcHzKmv1SYGPc0rskLeTciUXUlchLKyy2HH1xhBGouW8yq2unUmljJdLQ3v5xYLU
         uM5IOuJBrUdfQMmifA50UbaAVYtEG5BWWLZWP+6jzfEJ8/if0iWGHYGtKe39UYADYF6B
         5IAmpRkBLP84pdFAjewgQ2WpJa4F6pSGiPEMWDqJdk65QFNGsGyhlkiIlm/9usthtAZj
         kFHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794210926; x=1794815726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDbU7w6uEe89phDhaMwHcxYRzgCJv3Al9f7qd8GX1E0=;
        b=AwgoYVwRkqSSZLGjoIoBRFcEtcksRFsNV3dcmkj2Px0aoeNFssmnGKqtpWwcA799S8
         zT8kfZGpNUn/yIhO793241qAxqqzZnXnLWCCBvF/foWHOsjdcIXV9IOypcxYu9i7+MlH
         rY+QdEFnmdl+Xl874+cIlp7UPjK3CsxGi9TvcUmI/8Qo/vuTkHpuxgAkHJQOCtQzPLAM
         JAF97xFjec7QQkjyNsRDH2sGQnrKtMJ0pkA2bqqBptRZdKP9snBlJAcu4Pwz8j3KXhqu
         A8VT9CZ+22GCvmuFdHCxAu2o3Y4778LGOYPOvtJbOZBODly1lMCv7sFkcq52fk4ilhwg
         FDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210926; x=1794815726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDbU7w6uEe89phDhaMwHcxYRzgCJv3Al9f7qd8GX1E0=;
        b=D/Mx29gsXSkUWirIeZ9VGfguaYeDAYiO9l7cLL38NFmmUv4KYiXQGWsCOYazqdYpnr
         BpxsCwWpdyEoNYmP/pTzKsgMg/hGXkD5dx5kinOJrw0QCrUUYMGi2RUZMt0qhxpebiAM
         5yx6MNxkKH5KoCtRzT3lhIJsBzyDLc9A8oUslfo6lvq3eKM6yPuMSYcWEo2eSur/f+xW
         bnnk1oV8ecntoZSB/9tVsTM7MAiy7IwFaS+ElLUv0zcSX/HsE8+q55GUUXu1kO9HFJLN
         414OtvfiXCvKu0vyFwAtAadPo55KBbyFe7dZCCQKehIe3TwnSV7zofoOLbYovjcx38sg
         fCMQ==
X-Forwarded-Encrypted: i=1; AL+hErEbZXX/+hK+IjFeTMmJhH4urrnLv9VkM4CTnbPQfm6HILT11Czm6xTjc4LwZQhuG2iArlq295eFD/JpKbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z90ogiCf7wFxDqtm8HFdPmZRtnUEWopnCOuVhpdw11uKZpImLwE
	e4yM7kq6hnDN9l1SpZsTA5+E3m9HPJZ7m+WmBu/bVYX6ZZAsZR8Tc8GtJeBrivIahMqCJf0pGlw
	toFypZ+k8UXhaI2RbEbM7bNTneoGPw6AQvp19957FKK71+uZOKeLDoi7OGIvh1rIrvZXt1IfZRB
	dohffxh7Yb6C99CvUi+CpSsqSmBSeHDoqnQU+1qqy+
X-Gm-Gg: AYBFou0/9PDL5vnWioiHuuHjxKK8MeMAK6noWcDCBNY9BS3Cj8nDflGRFr1PC+I3PPk
	z2vNwC3gFWRC3BSTvZCHuW7UhjdjnWlk7Dv4o83UFNm9U3ULDclNeeH6A9VhDND7uc25qSl6Nxp
	9GQ2Eq2KyqoG5xKUyXlW8HDX2ocn6mSTXhLXqjoBf2417NIdOn+7F3KYiF
X-Received: by 2002:a05:6000:3c8:b0:493:4426:96c7 with SMTP id ffacd0b85a97d-49584d472ebmr5698483f8f.57.1794210925772;
        Sun, 08 Nov 2026 23:55:25 -0800 (PST)
X-Received: by 2002:a05:6000:3c8:b0:493:4426:96c7 with SMTP id
 ffacd0b85a97d-49584d472ebmr5698449f8f.57.1794210925308; Sun, 08 Nov 2026
 23:55:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109005528.3477-6-blum@kernel.org>
In-Reply-To: <20261109005528.3477-6-blum@kernel.org>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 9 Nov 2026 08:55:08 +0100
X-Gm-Features: AclHuK-F0aAa7ExchMmGl93dcYD4NKkRoj8bjW7M2TOJzcF0GtpvvpBP0XMV2MA
Message-ID: <CAASaF6wMMtNBbntQ1TYq5Kg5FZzUGXDfwYizLjZ438GPejkAWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] x86/boot/compressed: Enable -Wunused and remove
 unused variables
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nicolas Schier <n.schier@fritz.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"Pratyush Yadav (Google)" <pratyush@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:03=E2=80=AFAM Thorsten Blum <blum@kernel.org> wrot=
e:
>
> This series marks potentially unused variables and functions as
> __maybe_unused and removes truly unused ones. Patch 4 enables -Wunused,
> matching the W=3D0 kernel defaults. With WERROR=3Dy, the warnings failed =
as
> follows:
>
>   arch/x86/boot/compressed/acpi.c:25:1: error: '__efi_get_rsdp_addr' defi=
ned but not used
>   arch/x86/boot/compressed/acpi.c:29:6: error: unused variable 'ret'
>   arch/x86/boot/compressed/acpi.c:57:15: error: unused variable 'nr_table=
s'
>   arch/x86/boot/compressed/efi.c:64:16: error: unused variable 'et'
>   arch/x86/boot/compressed/efi.c:136:6: error: unused variable 'ret'
>   arch/x86/boot/compressed/kaslr.c:600:13: error: unused variable 'i'
>
> Patch 2 also drops a redundant efi_get_system_table() call and uses the
> existing efi_get_conf_table() error path.
>
> Changes in v3:
> - Rebase patch 4/4
> - v2: https://lore.kernel.org/r/20260624120300.590233-6-thorsten.blum@lin=
ux.dev/
>
> Changes in v2:
> - Fix a kernel test robot issue by marking __efi_get_rsdp_addr() as
>   __maybe_unused: https://lore.kernel.org/r/202606240416.cXegPpiJ-lkp@int=
el.com/
> - v1: https://lore.kernel.org/r/20260621144116.224010-6-thorsten.blum@lin=
ux.dev/
>
> Thorsten Blum (4):
>   x86/boot/compressed: Remove unused variables in EFI helpers
>   x86/boot/compressed: Clean up EFI RSDP lookup in efi_get_rsdp_addr()
>   x86/boot/compressed: Mark process_mem_region() index __maybe_unused
>   x86/boot/compressed: Enable -Wunused
>
>  arch/x86/boot/compressed/Makefile |  3 +++
>  arch/x86/boot/compressed/acpi.c   | 18 ++++--------------
>  arch/x86/boot/compressed/efi.c    | 17 +++++------------
>  arch/x86/boot/compressed/kaslr.c  |  3 ++-
>  4 files changed, 14 insertions(+), 27 deletions(-)
>

Reviewed-by: Jan Stancek <jstancek@redhat.com>

Two minor notes for a potential follow-up:
- efi_get_system_table() now has no callers outside efi.c, so it could
be made static
- debug_putstr("EFI system table not found.") is the only message in
the file without a trailing newline

