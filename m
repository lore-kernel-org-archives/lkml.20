Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.245.111.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423411;
	b=Bxvh/EGbtuNtBAz1i96ilTh87Pu5iliZqCHk4sz556Fq6+5j0/i1klfz0VjAzfBPI8+v
	 D18nlo34z/44bQ2BJJg7d57ZjTO1431fxTCgPf6tnjCDyWvRQT+cdVKwAMYE7I2dP8lD0
	 vlOongFXVsu2b/bHlmE6pOfwEBJQt9C+gwxPNCOv632AquPIbYT7o7gLCnuTVKwXCOYOG
	 tGy6P93vFwlmGgdt9wtcZF1MJGyeQuz31I2AFxfNsbH4sxJ1zrGjV+Ry+UpCW4G9+Du4S
	 Ud5UfZAdeQdDycNoFcdTI3hDx2YpbaklHBYn2CZVeM+4Dkm9w08c1ZSsX11cvz/BN3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423411;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-Scanned-By:X-Scanned-By:X-Scanned-By:X-Antivirus:
	 X-Spam-Score:X-Milter-Copy-Status;
	bh=+HvJ2kFVuvGS7ZT5+hoLkozBmLJcLaDkGg+Rc7WYWmE=;
	b=o72ZooLDBJb6PLtMtdX/zS6nEu9F2jjVCS9hsD9nHETCavrQrj5W5HbzbZjE7FvapICu
	 XuGrOrr5oU4MMPSw2DbwymFGjXdp5dDHPZtwyTdUM+wIDfJ14Pf+9mZ/Ml6n1hTpWljNA
	 /M89wSRcJ6K6GJ78Dt9ur2LdHSDI1nKfVnCfnVLufIC3dvOzeEnmmyrwMZrrz397ArDdK
	 yKa/eYkataAEB/fQnL5x2DiblZGb/yIPH4kReCOa4lHyf7JOQx9SaAasfbtzVzRYTYnP1
	 i8PuLNBl8cCRHn3OBsi3wR7K+D3sSwPTcdEUeyJ3h2UUdloAnbrMAeMqypta5Q5yAwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxbox.cz;
	spf=pass smtp.mailfrom=linuxbox.cz;
	dkim=pass header.d=linuxbox.cz header.i=@linuxbox.cz header.a=rsa-sha256 header.s=default header.b=Hh5PLXpv;
	arc=none smtp.remote-ip=62.245.111.132
Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E36260ACCC9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E36260ACCC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxbox.cz header.i=@linuxbox.cz header.a=rsa-sha256 header.s=default header.b=Hh5PLXpv
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 69JFMfLC1208580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2026 17:22:41 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 69JFMfLC1208580
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1792423362;
	bh=+HvJ2kFVuvGS7ZT5+hoLkozBmLJcLaDkGg+Rc7WYWmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hh5PLXpv5/rcoN0VZaOLprddInBoOxdrtKPj8uYQo+VzSQcyZAU2ZNQ3Kqt2My1qX
	 /520Dy+VoiNeqPY5l/1x2zlBC6dLkRDxm6cGczTHN8N8Gr4biMl9ZkZKfHFtPNJR/M
	 AxZd75YD1uEaQr1hKEINql/b/YbZC2nZett8lwHI=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 69JFMeGg012171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2026 17:22:40 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 69JFMbH63191394
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 17:22:39 +0200
Date: Mon, 19 Oct 2026 17:22:37 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
        David Laight <david.laight.linux@gmail.com>,
        Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <atY1vWRBRUwpISKb@pcnci.linuxbox.cz>
References: <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
 <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com>
 <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
 <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
 <atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O

> 
> Sure! And I have more good news: after applying 55780d8a1dcc
> to 6.18.56, I was able to perform more than 30 migrations without
> a glitch. After booting back into 6.18.56 without it, both VMs
> crashed within 2-3 migrations. Furthermore, some memory apparently
> got corrupted on one of the hosts, since various commands started
> crashing too:
> 
> [  303.466091] traps: systemd-logind[3085] trap invalid opcode ip:7f7b5667e616 sp:7ffe1afdec38 error:0 in libsystemd-shared-252.so[7e616,7f7b5666d000+22e000]
> [  303.493810] traps: systemd-coredum[11269] trap invalid opcode ip:7fc6bf67f614 sp:7ffc075da958 error:0 in libsystemd-shared-252.so[7f614,7fc6bf66d000+22e000]
> [  377.528955] traps: systemd[5607] trap invalid opcode ip:7f791447e616 sp:7ffe83e61cf8 error:0 in libsystemd-shared-252.so[7e616,7f791446d000+22e000]
> [  377.556993] traps: systemd-coredum[12080] trap invalid opcode ip:7f97ce07f614 sp:7ffe28b56a88 error:0 in libsystemd-shared-252.so[7f614,7f97ce06d000+22e000]
> [ 3746.173043] traps: hostnamectl[45846] trap invalid opcode ip:7fe00cc7f614 sp:7fff89916e48 error:0 in libsystemd-shared-252.so[7f614,7fe00cc6d000+22e000]
> [ 3746.202305] traps: systemd-coredum[45847] trap invalid opcode ip:7f7fe9e7f614 sp:7ffea227cfa8 error:0 in libsystemd-shared-252.so[7f614,7f7fe9e6d000+22e000]
> [ 3750.581940] traps: systemctl[45903] trap invalid opcode ip:7fbb8967f614 sp:7fff733e5748 error:0 in libsystemd-shared-252.so[7f614,7fbb8966d000+22e000]
> [ 3750.612651] traps: systemd-coredum[45904] trap invalid opcode ip:7f90d347f614 sp:7ffdc7f55148 error:0 in libsystemd-shared-252.so[7f614,7f90d346d000+22e000]
> 
> I'm not sure if this is of any use, but I collected a vmcore of
> this state by intentionally crashing the host via /proc/sysrq-trigger.
> 
> Anyway, I'll give 55780d8a1dcc some more migration rounds, but it looks
> promising.

500+ migrations back and forth, no issues. I consider this solved and am rolling
out the patched kernel; I’ll report if anything new turns up.

Definitely a -stable candidate. Andrew, will you send it to Greg, or shall I?

Thank you all for spending time on this!

BR

nik

> 
> I'll report soon
> 
> Cheers, nik
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
