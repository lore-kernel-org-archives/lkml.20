Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843287;
	b=lmPDGr7sEyCwTOlmed1lZpdi7oAlqnif4UQjZMXY8k+GiIvJpjduNEZ3kGX7teaY4jxw
	 KD7QcSV7fL3AgA1C15T4Q1oA3cLfHMZSqFILF9+tEGIUAILaXIBTI5mWqWfZpB14GKvEc
	 FC2/f3roXxGyzLRmjEjaHW2lyQo2StcyBtaFe9Vpei0jojBMQRv5nOsyFcvz9tgw2DH53
	 qnr5C/CYVrAtExNJFCd43a/2V5PhWDnCKnCeT0NtHutgVA7BGVSJY8QRaXx9AmSlDTJkh
	 Xk42STIR8rTnuB6sLFBNv8N6fge6NWmPL65h2ye5AUhKEe5oLWUocItiTbJpTAiJHaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843287;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=XYafMCNtz0E1nhIL5wssgxK0HAUU0md9ukOmfv3r2XM=;
	b=o/pXEVj6epU01d+FRT/szuKWFaAAzyorzNcd3gynb9X/5Vw7J85bMcTLrGyQH8+pMhGe
	 IQqHiImCZtHpQEDmIPxOvhNREPSokRgYx8vCMOIninOV3vO0zLJcJ3jsm82maG0merSqX
	 FEzRK8VSFtUuzvnqVEaHAx6tnbCINNJB/VwI4CU+xyjeZK6yA5jT0J1aNiNrypCMvCWq9
	 KiHIQsw62dOq5yzvC989+9ROWHzUYzcezswzyvy8UbU3XCk0CuCMHpCaKR2g02qY3SKYM
	 B+srY7qhrY7zyF/0nCxhZfIHOJlAjfw5UelXFJM6dmQxkgDwgAY+3YzA1rAKSAvWRIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=0VzFcRiA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50514606A329;
	Mon, 16 Nov 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50514606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=0VzFcRiA
ARC-Seal: i=1; a=rsa-sha256; t=1794842917; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=clioOdOf2a0HKADKoJeT6fPLW8iXhiWrOfaF/mYZbzOew9coQJWkJoAKv2hH/iKp3aSswKHuDc4FMUus5Bb5SJTaIy8EtULZYpMUGUU49bLe5x/PFZ2borl0evN/j548VzZ5FBHc0CBt0vVzo5qssM493HO6YoCozzhvoB+dUms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842917; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XYafMCNtz0E1nhIL5wssgxK0HAUU0md9ukOmfv3r2XM=; 
	b=UN1DIX+6aALAUJMr+DTF4PPtkzfpZ1CY7bvhji2fL+pRhiDE6IfBBzAY7C/LEZqZWtV0CIMyZWwUujX3vQVRNsyyOqNtlXvtUH8c79NDqpb/PyHzec6CfXh2wODpKFHrR8edeOiy6sy7FVc6kbTEP0hOCYgsSWxyiMtL5RwuaYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=0VzFcRiAnBrk3gt0NMvpKHHoRvUoaTtkQOOGhRMx/25CnmOhL/QmrBL/rpTOafLOkJhrUdsCzko3eD58FDqABce1i8jt0EruNvnoqf9VKREPFZblH3qEDd0IEz1tHLEs2Ecp4GFC7AGil8gVVE36Zpy7vaWxHweTchr5vKMaPkEL/kOPbCglbDWJDDuqkk+um7/eaclPkSR+ILDEjteabGZPNgEd1k1RqzzFQyxPx9X75mi0cq5/TZI5B3/BzEWuaMmua67OiR4PJYUxf8VEw5lmGfgQFBpj7BS8sYTOGkt+Zq1v+IiiFxwK/ZXjeN1fjDG3ChPlrO1E76v1u6Z/bw==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=XYafMCNtz0E1nhIL5wssgxK0HAUU0md9ukOmfv3r2XM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842914329313.80095186194126;
	Mon, 16 Nov 2026 07:28:34 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Mon, 16 Nov 2026 20:28:02 +0500
Message-ID: <20261116152804.781-12-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <ef6d8d689d88443e993d667e7a75d538@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-11-owner@ph4ntom-rev.uz> <ef6d8d689d88443e993d667e7a75d538@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Mon, Nov 16, 2026 at 03:45:04AM +0000, Ping-Ke Shih wrote:
> The commit message may just say that fix the channel in monitor doesn't
> restore after monitor interface down/up.
> [...]
> Declare a local variable 'no_chanctx = !rtwdev->ops->assign_vif_chanctx';
> Move this upward after rtw89_leave_ps_mode(), and update the 'changed'
>
>    changed |= IEEE80211_CONF_CHANGE_CHANNEL;
>
> to share existing code.

Tested your exact snippet on RTL8852AE across cold start and monitor
down/up on 5 GHz (80 MHz), and RX and TX restore cleanly. I will use
this approach, shorten the commit message, and place the patch before
the feature patches in v6 as Zong-Zhe suggested.

Thanks,
Enver
