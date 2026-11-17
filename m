Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915672;
	b=b7yDtEDXEIXmNHIqeGpCsPiWyh+slfk/AxJOx3FN1jWgzTHoP41oLSmAiVYAAbAYbuaD
	 XIom0s0+9koaM3KsfS6ndOPgsvd3dsLPfYyXapyL2OoXZD1v17QKS6g64Bt0yppDGFP1H
	 nGmcOa8v23rh+VW/RkqcvBBCmrTv2Lyf2dr00SfXbLVQCBbwB3T6rCY0mp7acoeYTHluo
	 abo/9aEcJci5PsYGsNK5bLEM634PvIB8nBAlb/6BH6jGAi4DXokFpdk5TdavTiIW5Wyn8
	 0qGt5lbiPpCCxEUMPz/oE7lpuQVwgBvhxnm5ZjrkzfgC969MPMJd5bCBd8N/gS9ud+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915672;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4TxsdMg7m2TDwJDxiSdvyBueM4da+4N/m2t3StX1N6E=;
	b=RKOPlPrEwYncILPLYcRWSBZVCYTEKclOt3CDODui1OVf+E1zTDKvUq8Z/Myo8KBRh3JM
	 IGbpO96FSumcWRtXhcZ69v63Tzz6mdfUG4zaN1Hrf172dR5N7ZUrV52R9tR40o5tHgpu9
	 Gzp7gT0RQ8MRNOkjp13MzTMbeZCxOddmt0v/NZ7SQkol45Jv391kNGpM5U4hMDBgu10pF
	 RnwFAshceZas1snXD2rewLv/c54Od3iifKDYMC8VGDe6t9Px18t0j83HEbjq8iTd2eQqU
	 2pUII5nijesrho7w+3RJCupSSMp3vn9pVOJHUrybA1AsxS0FT7iuSc3KY+nDcIZZAoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwf0E2uX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687C5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwf0E2uX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D6B1F000C4;
	Tue, 17 Nov 2026 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794915672;
	bh=4TxsdMg7m2TDwJDxiSdvyBueM4da+4N/m2t3StX1N6E=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=cwf0E2uXEt0MCoR5AHTisCfgPzrWdjOp/vFC4WYnn8qwhCC2tRzmxsakEbrVXUwFV
	 PTWgs+AlFsFXBsugKeRdCOl8FxWL8VVx01LCGIF8eG8rHP2QPsqc43QSJtan/8omPi
	 KF35b8sHhBiTOmB5V6i9BZbcxU8QI/5PHkw0Oq7I5E3JOzz0u5mWI955JCtlwfpnNH
	 Da3B3wr/NmoChZemsvpAl2gGo/fvM2EBdxI0kJYuGSt+3ZsxhtbEx+exA6bcTWeJwb
	 Y52ByWF/8mLuxMqgbqC92Zvd4kp1hNId6caG9RFWQTwQKPtp/1IZkndbIIrA/dPo0P
	 1ZE2M8bFFg7gQ==
Message-ID: <21efc4a5-41a9-40b3-a9f8-ab847beb74fb@kernel.org>
Date: Tue, 17 Nov 2026 19:41:09 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 17/20] f2fs: support subpage blocks in
 online resize
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-18-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-18-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Resize works in blocks, segments and sections, independent of
> PAGE_SIZE, so remove the -EOPNOTSUPP check.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
