Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924441;
	b=ho70+RjaULgV0Abfg9AcN2mWik1+RvNZs4L1SxPXgb1a/oShqoWQfBOCfmfnXr+UeiWI
	 g9LBQCIcDD56l20dmYgUnttpo+s4148PE7QHd+q5PLxQM5lqLUmQ0yvfFBuu6zS20OLng
	 kO6CZOI3QttGhdQb52TpNy5/vNw0LKdZ4rMt/wvwa4jAKTFjXv81/yMjWjaosAPrhqtu/
	 2ncvsj24wrMosh6D5qHK5CeQdUwAQryli4avDnSixMtXL6X/WFZSWFAyAxPkcPsUr7fMZ
	 KKr5g+PdQuzaar2C/2kYVL4YHVZ3d+DHY/Sh/wCGZNYkWilL6LxB/+63pNnlDGPNWSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2Cmw+hgGrca0cV0vkwktD7z3ZurD9kF18J0raLZDmHI=;
	b=mtYFmXtMPfoXPSiy10I2reecz6lDknxlBujJEU2vBkXiOVJrwAOfCUwz2CzubVfDi1kV
	 UnawRqSoZr13hgRoZaMi9m/drdnLMNtcVwp62Tc+pkPqltKWBOS+RuqMa4AQiP15RXNjC
	 PMrkmQ85kOOxCryETqDFHeqPqdy5HYfTjXvgrPe0rPOsum8SiFrjTDTfbCUHfNnQN7DC9
	 MI9m9vUwKspcn7EOi42Rgm+Z97ATtV71iQe5N4LqZ/99+sNBW8rzSTAOyAtQnzf3U0/AT
	 b69iSf7FN6Gf9KW4DkHrCeEAIiqk+4oFAIiHxehcw00Xz7hEwly+TfoIbMXIxWtJ/sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZQQ8f3U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A397A606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A397A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gZQQ8f3U
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso188a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924439; cv=none;
        d=google.com; s=arc-20260327;
        b=pJKGUZ8XzsTcks2T3HQ6TxGSmxxju98sJmYd+Rfvsgy68UDReBYyg8pY53h0A1PaVY
         yCoWoHk7u5N6m/NSitkRIkPSMxWpsJcRCxwQ2NLg+sXQ026gEHvxd1fzR2HaC9NvPtdC
         Z0K1m43xYWUatOE9BVoQ+eeswOp2FaDZ8LAox9IQK4W5yYUNNBsDmNBlPPOxcNo2Qso/
         mhOS/SapTZUEI/hknWwjwfO1MPCJkLf+360rZPq7nV3TDZSn6xgSDms8HTMrY+vTeRY2
         GbIs/+4IOqHAxmMgDsfBXZTaHiZEZu67TdSPjuXAey2Qqlgwsj/m5YVqlsWBGdPcOfGA
         Znlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Cmw+hgGrca0cV0vkwktD7z3ZurD9kF18J0raLZDmHI=;
        fh=oJvuY8gO7GQs96Q8p929467bMqU+7yojiFvYAusS1WM=;
        b=UUZAlA9T0VIKz91ggsgVinuNju8BPyiYXDWam0KoMFmqInMRwMgrVSsA6b32kjoCpb
         ol2+U1Pxvm9/+mkEFfTsjisKUz9QYKCxHlrRXtDavrxTXePhOuJ/LMUc1MWlvYhX7GAf
         kuZUJKRY2Wa7YqNL2SXdmO6pI4XORWt8o+EcWckVYBUjkZNce3D4eoPqraaFRnbNyz8P
         tcwhlZpR95q+9zbLer+wJZoc1P+MZD4HZJbzPDzAk1sJE2RXXhmsMx5mRKcEuWO9/8AW
         xp7jsvF3LTL9BM3kwLfnJwMsMgPiDLpwDunBTlFcFFeROkoDoaVfQyIAiKEJb30RA5js
         sJuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924439; x=1794529239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Cmw+hgGrca0cV0vkwktD7z3ZurD9kF18J0raLZDmHI=;
        b=gZQQ8f3UoEOTbsqL5u/9Hg9xW/ubMvWv5kzw6sfnOfzxolq+K203h0ZFCiimIt33oN
         lTcIIJuqilnyDXNXzJ/kZPnBhxF/zOAkrgrZKLIsVBsUYJIDrIuysd2iQTpBdbnBdcW/
         hjp7uINzg+yMC6ho/EnYOCIHr9WscR2Ywva7USeb7Mj99B2pmlKuBJV+ycl8QoxOOCo0
         /oN/gNpMwmehGCCVFQk7dXfGWM4GxA62snYs/iQFszKrk66Dqq1fTZaVV+D52nOq83MC
         tjoo3wpP5WW0DW1XUnV3SdJT7kaGjzw4N2x3nFq99YwoaEngxvdzeIRtB0hgUhLgDh6u
         MM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924439; x=1794529239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Cmw+hgGrca0cV0vkwktD7z3ZurD9kF18J0raLZDmHI=;
        b=NYjUGCFbomLOfzJ+p9QhIn8A4CvV4aTfQzGZzAGMv7SnZB8GXDrs6HvxlKEDqjPt8F
         Z6XwtxST3nLg2e1sTR71kHQ2f3XQd/Ds3OT8uTOfDowW/VKhKZ/ekadWSwTyYHKJbJs6
         XuqcxpN2N37lijldmmNqEx/Nxzm1KYlt3iMbz2ar6N+obfERiUIoTv6Uh4BMf3id1DUz
         RHv42YpfrWhMPsdF6C3UCwtL8LDSZku5NrT6TXuUNQlJZZfKZkXcLLCezz04Sx8dBFeZ
         HSJkTMJB6BUx9npAhx5UAMRCD2ndjQpa0YCRglnqhn0NN2K83sUmh27+tNBk1FdlgcDR
         T7ag==
X-Forwarded-Encrypted: i=1; AKwUvBwdImZRTxacXGF1vcvdQZ8NzAwlJWsvTa0FVlbf7sdPAoKU+k+2N+DIr9gmlusq7WEAj0KkKVS7HO0U0N0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HNQ2cd9IGThC6EoPGSP+mFx+rPvijd1ZG3K6PrGPHIN6BK+uO
	fpofHt4tmuTCyOM7LdY2H1Mwh0uU73PMYAzxP/BCM8OQhpQwHn9Jz5ey6zT0YUK2gEzzp2AB8OM
	lTyZvTHQRXlCIBgv+RGzpRn5aRG08LrkKnVu1n4eD
X-Gm-Gg: AYBFou3VFtGm5q6o3wgXDqdSICizTsIKFDTr7BTJB21NdndqBFHUmCGN6msR1RgW8IL
	Xp8yTsOk0i9YGFeUbpvy5xKXTUpJJb01JBBy8dZhpez29Og20xZn/Xi5j9bNqZb9z1MPP5jPrvD
	pyqXL3JPRuPa+bSAP4zAgLyQ+TMFdbWQwdhyYwEe15JKm46V8iHG+36gd7OkbZLtFBnal8A06j1
	5yZ4jDd+Oqt976Crq/RjrYO4Dnqw+Gz2rvSijAej+0pM9THETyobCr6v0ilLNRpWGGZSwHpPDq6
	cWfbnt2KcZMpe7kF3fyAYirgjlZAPhHRNobjaFf4iL/uR2Ub0Y4yZV+vXAIBq4sLeQJxs9IeyBt
	NrzlO/D+rt9LyxIIopjZLCd2JMi/MOCztw5OAZS1xPqMLgOysJ5ZdkJmqLQU9W0G6bxsPyMGHG/
	I4QMQXsMzw2qM5l/Aq7gFdPdSS
X-Received: by 2002:aa7:d416:0:b0:6ac:bdfe:116 with SMTP id
 4fb4d7f45d1cf-6b5d53ee497mr21203a12.16.1793924438243; Thu, 05 Nov 2026
 16:20:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-7-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-7-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 16:20:25 -0800
X-Gm-Features: AclHuK945wLS55Bs9k563D284TV68MEFpy9i9Pbs07hOBpNnLv-1kEGKVrDeD28
Message-ID: <CALMp9eSo7amBdqve_wUrE=23MmvoNGnYLbu987vv7DgHm5tpyw@mail.gmail.com>
Subject: Re: [PATCH v8 06/20] KVM: VMX: Remove unused control-register access defines
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 3:39=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> CONTROL_REG_ACCESS_REG becomes misleading with EGPRs. Rather than leave
> stale, unused definitions behind, remove them all.
>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
