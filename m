Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902F93B9D81;
	Fri, 16 Oct 2026 20:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792184062; cv=none; b=dRtqDY7qMy6OIuelqy84J/KuKv9oAJ7iGUZCtOSjNPPYgwoPKh2MaCv7u30TGh4fnNJKolPvXFVbqgQJW0oDYgg0PDRIyDp3LbtYlH9ZivyO+LyRJ4otQSdDVN5Fiw9ILzt91QRSw4YVuK7nGoJoT+RLFHO+I/DFwRDeDBADINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792184062; c=relaxed/simple;
	bh=1V4l8uRu2i96ghxvDwYiBzQeDgK2Qzolm6DvGR3SHs4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=edQgGCCf8bU5Ax4xkPTrL8zKQ+RrjiuQBwr6u0i/qzknmm6pLz6Jl/FBEWoBPvC8YIj0vcBb9bqEhnvF2sCKWpQVA+U12HlTzt/Al8gZjcH1EYxv0dhfK5pjJugbjes5UY30ZG+ihK6G5LaWqUHKZs/TEKbK6ah8qur8Wc2g1BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPrvzyM+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPrvzyM+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFAC1F000C4;
	Fri, 16 Oct 2026 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792184061;
	bh=GrVb6jwevewU99eQY/kLucIj5BipS3XfcwgRuYHjzm0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=dPrvzyM+XM2Szji4h569SNoCSHP3zVbMpc1JrXrTgIKObUr+iBgxdCyLzK1bUhy0W
	 jWrNSpv04ZjvQ9NVVLS95UbQ6UuW6UWYjaPUANUxjTppGUBbJ+4O0ZJPF7u84ai0Dl
	 P5nRZxqeRo5ZRMgZS6XkoakxjwkV9VlQndypRzeGSIk+HgyYtp/xBui5aj65YPPc5R
	 aewECvO1uGSGkv9FFTFmCwV3LiyQIS5ei0qkWLFs4BPhbMtSA6HujE2JSpP6PeD1A6
	 Bi/+bBrJYbnL9uaMpxmtzXNQZFvqzleILqkxAlulPx11RzJ148Tqz21M1ruamxR85Q
	 WieHtibx7C6tw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 22:54:17 +0200
Message-Id: <DM6K85ZAWSUG.VCF8TRYUDHJ0@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] USB: core: document purpose of interface parent
 reference
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alan Stern"
 <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
References: <20261015074831.1418677-1-johan@kernel.org>
In-Reply-To: <20261015074831.1418677-1-johan@kernel.org>

On Thu Oct 15, 2026 at 9:48 AM CEST, Johan Hovold wrote:
> See commits:
>
>   524134d42231 ("USB: don't cancel queued resets when unbinding drivers")
>   af61396a992b ("driver core: fix parent lock use-after-free on USB disco=
nnect")
>
> for further details.

The last one is now 0f554506a3fc ("driver core: fix parent lock use-after-f=
ree
on USB disconnect"), and queued for a -fixes PR mid merge window.

Greg, please let me know if you want me to include this one, or if you will=
 take
it after -rc1 ist out.

Thanks,
Danilo
