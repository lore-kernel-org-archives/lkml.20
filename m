Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09839B94F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399308; cv=none; b=fjQSvHBXoVBxHye8vroCNsZXgsgf4KkOsaVCK1SNL6XMJV9xZk/9gchi6PYh2TlkiNGEZczo/jh2j1AGlWOcwRK8kYpKn97zZacZT3VH3jBlD4MusAUqod4YiX6/CVlTvqmy7XLiIKp5EJ7KldcCkfekfS0VN2/O2WBXaDHVDDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399308; c=relaxed/simple;
	bh=DdVwtobikflc4dPVXmchJ5cb7Aor6CxX3L4PAfgglFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChVz6sRVY3vkbVRP6zy5QfDc6TquPKZrzlsrg6GBjvZ+EOCw+07ZqIGwHdlKKhucmVQG3j30NyxLGRgbogsxjoowj5UzwBN+4UawhcNebf6PqLG4hTsBZQEb3SwLoQtU/4Ps/spbvoZWGrrZwP4bEOuyHFdRjh5iF+2MBVTXcPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=uEIFfeil; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="uEIFfeil"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 69J8f2hD1170196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2026 10:41:02 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 69J8f2hD1170196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1792399263;
	bh=uX2TPHTXMC8dGzpy+XOl7entqN+gnCyUv9Ljjb8ldcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEIFfeil7ssJaBBmWiND1ItLKsRJcy4DAmF8CjtZoPI/WuyjzOd6Y1v3cTPpveuVv
	 UOFr7zUgvX1dpfRXWXwgxD/+oxJVmazECRLFL8MmWeZ1QAVGHX8YC9I5Ynsa3rnWvz
	 nIqJMTT1ibf/Y6p8ov3oRP2e91HaCdWzaguNav8U=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 69J8f1QH023969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2026 10:41:01 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 69J8evSi3176760
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 10:40:59 +0200
Date: Mon, 19 Oct 2026 10:40:57 +0200
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
Message-ID: <atXXma5NXxoSWJO0@pcnci.linuxbox.cz>
References: <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
 <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com>
 <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
 <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018201538.d0957878f378a9821852836f@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O


> Well we initially thought that nested virtualization was not involved.
> 
> It it indeed is in the picture then it might have been 55780d8a1dcc
> which unknowingly fixed this.
> 
> Are you able to test that commit on the 6.18 kernel?

Sure! And I have more good news: after applying 55780d8a1dcc
to 6.18.56, I was able to perform more than 30 migrations without
a glitch. After booting back into 6.18.56 without it, both VMs
crashed within 2-3 migrations. Furthermore, some memory apparently
got corrupted on one of the hosts, since various commands started
crashing too:

[  303.466091] traps: systemd-logind[3085] trap invalid opcode ip:7f7b5667e616 sp:7ffe1afdec38 error:0 in libsystemd-shared-252.so[7e616,7f7b5666d000+22e000]
[  303.493810] traps: systemd-coredum[11269] trap invalid opcode ip:7fc6bf67f614 sp:7ffc075da958 error:0 in libsystemd-shared-252.so[7f614,7fc6bf66d000+22e000]
[  377.528955] traps: systemd[5607] trap invalid opcode ip:7f791447e616 sp:7ffe83e61cf8 error:0 in libsystemd-shared-252.so[7e616,7f791446d000+22e000]
[  377.556993] traps: systemd-coredum[12080] trap invalid opcode ip:7f97ce07f614 sp:7ffe28b56a88 error:0 in libsystemd-shared-252.so[7f614,7f97ce06d000+22e000]
[ 3746.173043] traps: hostnamectl[45846] trap invalid opcode ip:7fe00cc7f614 sp:7fff89916e48 error:0 in libsystemd-shared-252.so[7f614,7fe00cc6d000+22e000]
[ 3746.202305] traps: systemd-coredum[45847] trap invalid opcode ip:7f7fe9e7f614 sp:7ffea227cfa8 error:0 in libsystemd-shared-252.so[7f614,7f7fe9e6d000+22e000]
[ 3750.581940] traps: systemctl[45903] trap invalid opcode ip:7fbb8967f614 sp:7fff733e5748 error:0 in libsystemd-shared-252.so[7f614,7fbb8966d000+22e000]
[ 3750.612651] traps: systemd-coredum[45904] trap invalid opcode ip:7f90d347f614 sp:7ffdc7f55148 error:0 in libsystemd-shared-252.so[7f614,7f90d346d000+22e000]

I'm not sure if this is of any use, but I collected a vmcore of
this state by intentionally crashing the host via /proc/sysrq-trigger.

Anyway, I'll give 55780d8a1dcc some more migration rounds, but it looks
promising.

I'll report soon

Cheers, nik
