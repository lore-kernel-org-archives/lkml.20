Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B9B1FCFFC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184961; cv=none; b=kOm9zK+m6xv3FXFVhMXQwfYqlQTtjFlSbDm3qttlTRcZNjO3vF4/WBTO6IOYxoh8R0txsb0lLjs9SsdxsuE0EqYyY+Yc5L73z8tfBPGc6IDSUacLAm59i/fYFqNX31cvd/sdmxTN1Ut32fv9N8v9bG8wkdMjCbAQVPojhq/lwBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184961; c=relaxed/simple;
	bh=L6oFpqBtkP4dSgVh312zLHKJQWKbAC9qrFyoscDAtL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuAuOiMF+DJ60LyT6I8omCheLK3VxqSnFDh26uCwN6bUqJbEqdwVOjOuZ4VuVihGDDgYysMz3GuWOV3WymA/IcCLmJLvqpgaGUVFSRAjL2hR2SKF8EaEa/VqWnzwyfIcNpIGveKCppSmd3aJkRlq6o9gVNkv+nFYPXQtkl+x808=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Px65jPBx; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Px65jPBx"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-677af43eed4so474760d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792184959; x=1792789759; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3kcaABY1wxvfGcJvUlVBxGbnL2EPcgOQ7tPDx9WCKSU=;
        b=Px65jPBxGzR6xtzJU2UspsDLAykZqiWiOe3+fzRqJN3fAgJqil8n1hZXhCqRveyKFG
         TmzhS+RDuFJLQPxYDAFcDWNhI8C2RisHT3eSL3pZppj9uUV6eFi8GxVWxLbGg5cSAZwN
         uCYWfRRKfnh/N3NsLt4g2rAsmDCTjgUKCTt/oSsDCRTyG//QpioM9wwq2yR4FngZo5Da
         YOFpcVYCDOkvU4xIoB/LXXZJr7v1dpb2JQyDD1GEH3nsu3DS8h2y4Ed6BOE4/hQ4vCm+
         Lk36zuUr1J9nj/YlizSihJbvbwYxZcGiUrqNeIDJjFnkZX9HajzzNvKJBIKQBs9vfW5O
         wa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184959; x=1792789759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3kcaABY1wxvfGcJvUlVBxGbnL2EPcgOQ7tPDx9WCKSU=;
        b=l2MudekMApxNz/gXhMwr3RNuDerwNXcZ182qmT6EsZDljDmnb6AafzAP5wqaBrU4FK
         8mO43xDe19ck4NYOl7SX4I4gv3G0TxU4POEAXpdUoTiphzzFUhoPkTxLXT53Y3jynscQ
         VY/MGH19L/NJiIv/v9c9cjJD37OUIFYEq758M4nbOW47tTL5WPkIGCeinT29TTqfrq10
         6dR+LwLf7Oa54Do1f1Ovsia1t6Wflc1d709ZcHjhemiuvIk8s8e5hC3JTkBjKeOmrAsL
         NHST+agCFa5r8F00UGovFA2GiQ7se+hgqRxOWK6m473ns3PQUgMBZRWlIyBpXrJRU5r8
         qsMQ==
X-Forwarded-Encrypted: i=1; AKwUvBziiIFY7QPf2F4yi5lckyK0oJunFyVmA/ftkkujWI6xPLA1n1WYIer6/TIPKsus64+6zYr2M6V9iW3akfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiS0ip2Pw2swZFggqLHe/i8c9x15mTO0kETYgGisvwBMiSa8eA
	F+Q3q/ibdfRWgNZqOz33CVs0GRSyqRNPlXV6lO7HprhOdIqV4AIfr4wMYvgSt6aTzJs=
X-Gm-Gg: AYBFou1/XG/YJZjfgO195J3X3zhXbZ+SPb7TWa/YNFjdcER5Iid+aFayAmsTvkh0KTA
	j38gBUuNmWFODBQUdszNtEOzi6hcW81RYO0ZyZKYnc0UjmA/0tH6kxP79pEm1SlLuOpGgcPNRes
	DPULsQ7zAzghoy7sEfX/RX4mZOqavpPWabv+1H+ky8pUDNriG2dk9pZXrPlbvqToMncKBGPpIVb
	HuKJ+uXm1q/IKQxgb8D4Ug+6ecdwUfLak0/8DD4FZgGzBaBqTbKrJ71Ln278BovtFPeg23SzG0p
	ZHdA+QDGM/LLE4ivR59wUxBJ6Acb6Cfc4W0TsAPmLHRaHOWbo1uCPftiuybdCrlfvBdYitSJlHq
	ZKDsEMAYa+42ZSmaIk/x2CS4AxxzQbfHvbCrcq73rFxeBndjCk82qVXzHVMNzer2EumcPftL2G4
	OVNC2w1rBRYGIqwWBUejcC8Cb0prMKoaAaqLdLBLS521anq+zY6n83XerG2/zYhAHNY2RYozwuV
	SgaQCKky3vFr46zgK6d
X-Received: by 2002:a05:690e:191a:b0:679:ba28:1272 with SMTP id 956f58d0204a3-679ca7b9b4cmr284821d50.41.1792184958919;
        Fri, 16 Oct 2026 14:09:18 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e11207sm1547350d50.8.2026.10.16.14.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:09:18 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:09:17 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when
 available
Message-ID: <atKSfUS8rRW3mHyw@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 09:53:00AM +0200, Radim Krcmár wrote:
> User-mode use of Zicfilp and Zicfiss requires senvcfg.LPE and
> senvcfg.SSE, respectively, which we set only when is_user_lpad_enabled()
> and is_user_shstk_enabled() (CONFIG_RISCV_USER_CFI, the extension on all
> harts, and not disabled by riscv_nousercfi).  hwprobe reports the
> extensions from the per-hart ISA bitmaps alone, so it can advertise
> extensions that are always disabled in user-mode.
> 
> Report correct environment to user-mode.
> 
> The changes to arch/riscv/include/asm/usercfi.h avoid
> IS_ENABLED(CONFIG_RISCV_USER_CFI) guards in the conditions.
> 
> Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
> Signed-off-by: Radim Krcmár <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>
