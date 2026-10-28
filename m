Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793177298;
	b=MUmC8KTKQ8RPIE1j10mvkYzhoYc89yTeascIet+1EFAAl31XTAhZyl3mRXAhYGjiN5Zx
	 eQBLuLh4Fmh9MyNaYFdiym7B6VBi5nKLcYtBWqdHL4w7brwEbnA0xG1xzruQJnBnZOtCD
	 DpDNSaG78CRFM4GNPUQCuRc/FlVg6stQMm4EzdO4aCd/cRzmtHt/Mh1gSrCGV6xfNXvqa
	 RYwwjmHfkB5fVyJOf+drBs+8kib51/SBNrLH/gjZdVY7T3R7dmDM/CqrD8+qJ8uzbGQXt
	 aGTKAKT6XT7sHsnBA441bIg4kKJbwIxJ+lRFqi1lHTfqObgzhKvGMUzKv2F4UHpTuig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/P4FiXSfTahRag+IvS76kiNUJNsGZXNeZs1soro+q0U=;
	b=Gd/J4z81/QbPiLQunE4WbdNtlWDqbEX63N2tVWXHdru2BW6l54ykXt3194Zd1YCq1Sli
	 kacv7FlUucwMtH5mnPIfiGSn+Ilq5pBvM674KpB9hhzcp6c7BR6gbWBl96MpBwp5fHLjj
	 kss86Y7VF/AXtnf7T/Mxbf0hZ62Erek9p2td5tQ5VFhTsbO2R30rw6tGiVl7fEZ6edbAu
	 MLUhpnGF7xNEqyarT+HiSMV6og6Lkeit62lyb3GafJnZqIznUuaUuZDSXunbcr/X5pDdl
	 YcRDMci97lU/cL0X4kLz+f1jiG3CruYmrV2b9+wwlcAfvOwxsDRwn6xFJAweS9Ng5Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D98NASGz;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B18606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B18606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D98NASGz
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11080105e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793177296; x=1793782096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P4FiXSfTahRag+IvS76kiNUJNsGZXNeZs1soro+q0U=;
        b=D98NASGz48p7nzkolCFiBv4ijS+AKWuUcJww6ATbM972WUm4X5vRZV7iNzb9SIxKyx
         gFC7a4SjHboCVyZlMEQewuvtX9pBbZJ8HQXd/YRps3XtTbGtkp5xlpIMBKURowHrhJsU
         EhDFxa4FvXAYYT07wlt2TAHY3/eO5IlCs1/zrnH5D+KNjaDT10CkZerq/B085TALGqGQ
         WfM4VhyXuV4oFa/7BOzbL/T+qAV81zbphPF5Sw14di0J5Qz//ji+Fl3yzluw7lPLV3Fb
         aOGI4xsBxHqcn7jKTp8hUtcafadwY4BQSUp2z7uZgYIjKohp8dq14HCzQrmSmCH7JchF
         A4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177296; x=1793782096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/P4FiXSfTahRag+IvS76kiNUJNsGZXNeZs1soro+q0U=;
        b=G6UuExDXH+7RvgnP0NNwYfEa+EJcCzG46gSlHjeAg4dYjWjU2oota44f/c2QtoqHcS
         OLHA+0zzaL3TMbhycUe2qnpnsBdHpNpslHsLXF1oEgfmuSoJJdgPKokoZQX9wfU8zVr/
         mJk4mKqU91fRHGReVN9pCmlz1lnWZ7mqaIKEuUToiXv6Ddl//osCPFDOhhFR35SzTurK
         1y6X0lNg6/55yXquEC4D5zbjmpOSy5DhSBqH6Z8kwhNKrYWQidw9JPrKsWB2td+N0w5W
         sSIdGYoT53fQLC7DPwonvYX7bUEzhBEfzepK7AwF6ZfNbetTGp5PI3lk3gTIERZ16lL4
         fv8w==
X-Forwarded-Encrypted: i=1; AKwUvBzyven9Q9g+9bun8txFFGRL8DePK9nFuPu/O/HbD+D1n9rf5u/ebgYcpyfzyPU5DZv2H35vE2SsnMRTVMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRtPZIRf5qdFfYqBRvkV0TDztdW/oJQB8zkb5Z+YKcc7QyblJs
	3BVsbR+ng/8fPaspK4n50o8tBr3ocfwbzHPiRpwr+3qjj7mLCETb4J6wIhlmDI5DTNE=
X-Gm-Gg: AYBFou1tj8qhhcm5WeLePWLgxmMbVGObp9N3B4tM1yVRLHKlWDSU0/4jjlA6qitVXfT
	OeplmitwtJBXLpx1vNvN/n+6qgav916J4Ot86q38wsbra+eA+Z3RWCYnav95wrt/Jan4/bDavyA
	Fv2b6VezWmOxz1JF8Bm5/isRqJgJIvyWsttgDcWkayVsQXqJIDeYjq1IiBfnN0ylsJCBa/PyVm7
	i8RsOQM0zC8kvgF9bnclBxfehdEsx5inQX7QU5KZy1YNklUG44Q9W32pu/0JMLRLVfd+vhSQeqs
	PdjbzeUhLcpUNREVb8sn0oJl3nWSDyj8N+4x5oUf7JavbtuG/VPTHVoKRIcmD5Uosq+dL08R34w
	/uk61mk7BdyRPKZ2a4d/c6tFi70w89oW91FAvG8O8ukzP8URMIKA4H4W2Q9pen5mgAtlNOMotIR
	HSK0H0OJIN3d513g1lllc4kRiLDwLr+M0DvhxvjGSsl/0Ekd4vhjC1TaBCkGQJYD4pDEKMCnvnm
	oJyatwhf5pAOf8WY2QdUgP0bP3tO1hzQZI8XDX+MIjaOigDAiS/Qy6mMZ9juEMpsABJBPXGqUTn
	oA6qoXCqUbQLJ9HLSREGJbIKnq4IbD3vuZZYXsXucNetd1javzD7UMghFp3fnoTFMvKR
X-Received: by 2002:a05:600c:a00f:b0:4a1:9c71:9f17 with SMTP id 5b1f17b1804b1-4a996d873a9mr22922355e9.9.1793177296320;
        Wed, 28 Oct 2026 01:48:16 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b5:e001:5d05:908:ac82:a3a1? ([2001:a61:13b5:e001:5d05:908:ac82:a3a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm25003415e9.2.2026.10.28.01.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:48:15 -0700 (PDT)
Message-ID: <5230664a-9666-4196-a798-260da5aa8e8e@suse.com>
Date: Wed, 28 Oct 2026 09:48:15 +0100
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
Subject: Re: [PATCH v3] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <8469d5fa-2f4e-4565-8d84-43d6b71b4a9c@suse.com>
 <20261028020958.1141513-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261028020958.1141513-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.10.26 03:09, Jiayi Li wrote:

Hi,

> USB core has already terminated the interface URBs, but a running
> synchronous scan may still be waiting for SCSI command completion.
> Waiting for scan_work at the beginning of uas_disconnect() would
> therefore delay the command cleanup below.

Why? What is it waiting for? And why do you think we can skip
that wait safely?

	Regards
		Oliver

