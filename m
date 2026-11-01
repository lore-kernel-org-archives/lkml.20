Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793532981;
	b=MZZhmlYPCHE7jSJ0Dj7eW3QVPM86/BwwLijiRu9IgAlKYw3P0d9+/qK92brcVexdT9YI
	 3fzcvO6mHM1cvGvUu2Y0swVmBrfrt4dqyqc5uTMYmGow2/5p+WV74ATh9+f4o2cTbFyxI
	 mNbr15aUf1DdnyI63TyMSuvj/Y+gox+fryIj9xvHEzjL+JG01DOVUNpPmUiw+HDWK4413
	 /SgEjyz2/Uee1Xlbm3Gby7aMn4jmNqTLoYOW2u5ecSO2zhj4pJuQATtEinJipGHuSt7Xs
	 riTf4M9qIiB/O8gXQQlg4LyOvshYjAeNm6A6vfI2WEEsbH309ETWaKsXvV46dUyiUTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793532981;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Subject:To:Cc:References:From:Organization:Message-ID:Date:
	 X-Mailer:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=e2074Najjr40eJjq29H8HmdCXIfITYYaEJGmkIK26yw=;
	b=Z4taXgj/fKCuHkC8eyAUE2ypm452SPMwP74uvK6NxdLJUiqz4oEzAwR2VZlEl3FgF6rA
	 DOJ5bUyXq9APqiXzvKu/8Rc4fo/u8mJVG4XZvvvkuKdYq7qdTvRHFHo8LggZ/DYUvH7LN
	 NaZv/BbCQOntI7MoZb816IJB+WnbqueWBuvo0EhsFLUHflaz5Ek5OjA7cqbSlDZ7KMODT
	 NccFC2KHTZ9w1MVx5d26goWHCuLNq0SLtgjPtCoUZpCzxKIhE4ZBBkJo+6EwLVwHg5kjw
	 KMTJ1RHsJosFZvE5MEbuzKZocdcLJ7KhHU05Gc61osXTpNDUbAXa8Wjs5WRHCot/Uwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xenosoft.de;
	spf=none smtp.mailfrom=xenosoft.de;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=KEbBjcyD;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=PNDAkENG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.51
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075AF606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075AF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=KEbBjcyD;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=PNDAkENG
ARC-Seal: i=1; a=rsa-sha256; t=1793532943; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MvHWs6uUGz4sokDNLAnqKxqDP5NQmEpadvtiGWm58YaDpzkmcmRhZcrUJBGcdT89xV
    79DbKt4+2ZhKaLab25sivqy/By2Q1FY7m1LwlJHDLKZ3W+oO9e1ftD0QMVFH29LMMRz+
    9t+tTsAls/vAZF2j2fnV6xZJYjmaj7uj56NSOWcpoNvirvxCJXHY9h0PGV/CjPAYjnuS
    Y3FXfOmnGxJi6741x0C9L5spTf4b96SRRgLDGMNEYlFFcAYKM/7lf88aWZk0F2NY5MRw
    B1YqSkRQECEpb+6W7l93T2IyV73lkXAuF3MXWtu10kFhSm08N2Ql7bItL0653RUBKMIf
    /S+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793532943;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=e2074Najjr40eJjq29H8HmdCXIfITYYaEJGmkIK26yw=;
    b=TYa7RsAfV3CmiQNjfW+L6S3Tl/RHCRW1GWXsDJ72XBRC/fDio6KhPCKTdQzUJCwq36
    0EWeIDEDxCjJkYFOOG735welSONLCnFSelX850BylYA4RrlvZlNrRoex1/qLVjR3aUDr
    Ajcevdrjtsaz+sm1/O1slVPsadM6WzgA/iOygbHGd143jxgQd3F2TodE96Qhdz02jBAk
    FRE5gQwuVjNmdC4oOZNV8ceTGz1KTKMIc5cFHP5HvfhmCRhFGNZg/mGmaP7T2yX9ed3u
    /FWYwhVGi1J+I/186E3n1atVSrIU83Bx+Zna+K5DmkQOYXWQNVEfcEp+WiwlrLAyzffz
    wW9A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793532943;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=e2074Najjr40eJjq29H8HmdCXIfITYYaEJGmkIK26yw=;
    b=KEbBjcyDZ57FlO0eps0VF47jJTpv9lDVMjf4a0R9RhUvZT7Ig3+/Z/wVk1zHLoNcP8
    0/eDKD/vSVNTvK3u/6wDweHdWAb6nv4NWdeG5XhxCcPA/EEIU517FYmlsm68Pmw2Jd8W
    sKTaeow4kZkeHyWGhTSZhBLQ0YRDoQ1DxrefaHznTZNLChzMv8QoXEcvmR+Z2XcSFxRQ
    pLAD8LurK5gO6MbT9b2YICBElKNsIvP71me6xjac+crAvx1seJjWQaIojWntpPpKvf63
    xDdDbx2hNZlbNK2QrKpXCn3HvAC4voMk6XnZ4FA/uVlweQdkCmp29Bky7xpCEy9mKi5+
    MOgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793532943;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=e2074Najjr40eJjq29H8HmdCXIfITYYaEJGmkIK26yw=;
    b=PNDAkENGFyPCp/YKfD9D8JtQ2Fl6OavCRQAlvZCVPHKi0SBzYLzlFvalBuw+lGvOGE
    FIYWCs7w32Hcc48xD0Dw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+m7xzg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.6.3 DYNA|AUTH)
    with ESMTPSA id e825d92A1BZg5TE
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 1 Nov 2026 12:35:42 +0100 (CET)
Subject: [PATCH] powerpc/pasemi: Defer Nemo IRQ initialization
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Narayana Murty N <nnmlinux@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com,
 gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky
 <info@xenosoft.de>, Darren Stevens <darren@stevens-zone.net>
References: <20260928110411.844582-1-sshegde@linux.ibm.com>
 <20260928110411.844582-2-sshegde@linux.ibm.com>
 <9d83e196-4d6b-4be1-811c-eb72527d3cdd@linux.ibm.com>
 <2a75097f-6b49-456a-bfef-d5e559ce719a@linux.ibm.com>
 <33tnw44q.ritesh.list@gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <8353fe7a-2313-8669-9603-c534f9b9bf9d@xenosoft.de>
Date: Sun, 1 Nov 2026 12:35:41 +0100
X-Mailer: BrassMonkey/35.0.2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <33tnw44q.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2026 05:21 PM, Ritesh Harjani (IBM) wrote:
 > Let's ask Christian directly :)
 > @Christian - Once we have v2, would you kindly help us test that
 > please?
 >
 > We think the other approach which Narayana suggested might be a better
 > fix for this and it can avoid preempt_enable/disable() dance. However,
 > looks like we may not have the board where we can reproduce this.
 >
 >
 > -ritesh
 >

Hi all,

Is it possible to add the following patch to the kernel?

Link: 
https://lists.ozlabs.org/pipermail/linuxppc-dev/2026-October/305189.html

It is more important for us because the Nemo board can't boot without 
this patch.

Thanks,
Christian

-- 
Sent with BrassMonkey 35.0.2 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_35.0.2)

