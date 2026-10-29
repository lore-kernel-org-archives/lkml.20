Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237666;
	b=FwEDmMnEaf94TpzNgoS4uie2UD68f1aBBw4OoOP3RfeDw5i4mniSK9nBFVUyiAEt4VFB
	 XjRTccrxzIVq7YI+S36AI1P4whJTp7Tz7e10b6Y/b7eumlS3EWnD98o66/6fEOC904RVp
	 o9TcFT0LW8q2aTxN8DFp+8xDsP7jSlodYEu9Tfb2U1mGznQRMvqko5qPt4GswuxVX0bYf
	 HIZMbCHDMq1vX8UhCYEw0LwdzIr37ox+CN1pGtMikXTxqHRQjgmY9MA9uaydrXYE5054N
	 x+dj5UpXOeUTqmLLmWLPIMHKSS0AeZkDWu5tSQTDCeNlQQGxkWfsDSf6XMsV9CpnlEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237666;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kFqYnLkny1QhGh+grTggM9at/kp84YzwzVgRpPpjNx4=;
	b=bXhXMsdDPwCmQvL+vBZvexMEdSxVaVhgCEWyaEgyPlRMt7ApXlyrspPLslbe2sHGGzV5
	 y3o3nPig8q4dwzF09fVRv566PAwhLX61M2rTRazUHVRECcZXHG4pbo4r8xVP3yK3caEsk
	 YglKJxFXTMvg23/JEbsS/KLoW1chYBB1l6rsKaKmD4/y/H17zNV6n/x8vrVDtTpCUn1Nm
	 PSRoeXI4WfvOVk5MTN78Hs4vStup8sKonXDOKGCHgha6xeXi67y10CmTbQxN9Dl3RHMty
	 mVYyKi7j8O+W+xELhUPUdI9e3iPptns+QxEF17YRtXAHZ56xoSS2NUIIdmW2O7iGqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O9ad2XBa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7968606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O9ad2XBa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217B61F01825;
	Thu, 29 Oct 2026 01:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793237665;
	bh=kFqYnLkny1QhGh+grTggM9at/kp84YzwzVgRpPpjNx4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=O9ad2XBa7bo/1WrsM+XrLEUcBgjn5hFxXY66xO1JQCI5uDBB74wX1Y0RLZ/CApVur
	 1Gm77GhZuNGb6UM0fNPB/zbWfVWm1no2rrNA9lSHCkvxYEtrMqNVNEMwAILlh4Wlhk
	 7OSw16UPY5OmLGlqL8CuVIGo5YJGox1tCv5Qx9Z3wBurMQaDVyoBa6yJXoHVhQ6Kw4
	 VXrqQtxJAX5AJ3M7KOJK5KGw4VODlDqJ+gC6L4uDIUwB+XqLGtd92iibmYCGqBi4N2
	 w44SPLTE4P+VGYzjY5NRSHni+8RIucPU/G8iqlpD5x7hDscNeT38Qu6DyWnTdLnMnv
	 T96CtfNjDzNFw==
Message-ID: <e2cd3f8c-b233-43fc-a3af-e0585483fe13@kernel.org>
Date: Thu, 29 Oct 2026 09:34:21 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, Barry Song <baohua@kernel.org>,
 Juan Yescas <jyescas@google.com>, Daeho Jeong <daehojeong@google.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>, Kalesh Singh <kaleshsingh@google.com>,
 Nanzhe Zhao <nzzhao@126.com>, Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
 Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [PATCH v8 12/15] f2fs: fix zeroing paths for large folios
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
 <20261028154407.1601430-13-nzzhao.sigma@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261028154407.1601430-13-nzzhao.sigma@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/26 23:44, Nanzhe Zhao wrote:
> From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> 
> Several f2fs zeroing paths still use PAGE_SIZE based offsets after
> a file mapping can contain large folios.  This is fine for order-0
> folios, but it zeros the wrong range once the target block is not at
> offset 0 in a large folio.
> 
> Use offset_in_folio() to translate the file block index to the folio
> offset before zeroing data in truncate_partial_data_page(), fill_zero(),
> and f2fs_get_new_data_folio().
> 
> Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
