Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F674570EE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010487; cv=none; b=ipEM6ru6sTr2ong/RRouDRyXePH9iOT8ywf1G2aRZnKs8W+zAV+KXFEtX5MJBVn/kcF7Ns33Ix8Se5/XCvTdqAyzuHF5woKi4bB2nY5deYDfCHMitQvf5LzPpn88dQcq0e32gnVvRMsEpOUWpftlLfAMt/6zPfZcazFnMYEfURc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010487; c=relaxed/simple;
	bh=xYX1ubJhvytFImf54qv1amtx1iuj6c3isZxDG2i6+3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKZqcJMPhkc7fh9CoCNter56iFcBrTZM+8hMs2CXQUyPm5HcdxkM5ne6R9by9rL9F4UWvWtxVXsMicjfg18quPj/w7ex/MOpMKM3Kmsj8SGC/GnnMQ2viRYl3iNHKBK5anmJEZE2wWJQm/5sHj622UciB9XoRD7iINjmgHuhj0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=dVRRcueI; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="dVRRcueI"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98505364aso5352505a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1790010484; x=1790615284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbBgwtddF+Rmb5mXPYMuNZ3XqvUCZVCRhQupANAjEM0=;
        b=dVRRcueIXEFTPx+UyoQpXBWrYS/bq1t6XkR9iUV68JZSfOZ3JyEbwqUAt7Km0wfW+b
         +vvCYfJO0Tr5mBHJPVLsrROuEG4O1oQtTOtJrxDS9OLamopNY4kbJ3Yd72AhpEGU0a1J
         WksbchqTWiKQDoy5QmeSoGjdlNWK2yy/ThOLAUgd72B2/V7kih7mOucdpW7dMPWa16RK
         NUu0JJH9h2DdWo0N4iXFpz4EJfm/RKETCXqwiHxPe1sYm4ayQpI07x1exbeZ+DIljuS/
         jDoePlNoAKddatQEjqLT2RUYOrZbv5gZYYZain6QfSHwTNTc9ps6qSYvKklVu7PPCwFj
         1uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010484; x=1790615284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbBgwtddF+Rmb5mXPYMuNZ3XqvUCZVCRhQupANAjEM0=;
        b=IjoA9fp1kvxcDgpWq6AVEcQE/sTuh6s1XSOtY5xo5XjSnLV7RYDeo5V1Le7zcMDD2R
         qLve74cCLhnv+D8FtrmagElvZfmQV+eSi2so1FN5VKAUIoeHfLYWt6VB98REm0BGVLBm
         lBLEeU3o+b+7qdpT4i5Ras/6a1MCnUKeozKdqh7DIdM9lAAb3zqm8tRdHECmHFh5CLRQ
         qBva8SGofMub2JuTxDQyQwtrAKrGTVk9ZKte9dpByg+hjW36BetT0apQu0co8biqcorH
         B5Fqt4PXfn5nBlPAe9Ol4sb9g4sOomD7KpmofjjzmGOEUO4qtyZilgzM9lYIFswWDuPn
         Zx9A==
X-Forwarded-Encrypted: i=1; AKwUvBx1zt/ANppGUS+h4TGgCIG6jMlVQQyrPbWEM9M2ddsqYy93ImJAjzzaq2v15JK5lZLd+vwn2wSmdwqJr60=@vger.kernel.org
X-Gm-Message-State: AFuF++k3U4v8XLi1HipSqjXejokaWLTFIuBEwP5Uyy0YkA0/f1zIcqT1
	5zd+Ld+zj8lmt/mEijP5sLCvzEL/C/tFbXLvsQ1C2NXH3buUm4+TZfNDih1whdTpzA==
X-Gm-Gg: AYBFou1XreOX7ML4pX/tju8IfWMoh/BsGa1TX3ZYdgxQ77ZTmPDRCCToY1Ec7RBtuqT
	ocdtbW2KoIK9MmdWoZx8MXzeArJi8CkTNXrFrYqrLFGxbPJHowbiR4OlynrjsqgqCyM/EgcIgwF
	MAmhKBRwUrEmKWUtI4/9JdFhubf85E97nt2wDZqno4sdDKdxcIZS1zI7yLqA7G4eXyNZYsT3dNd
	6mxSwJ96o4vXsPLII7/gvSMQe82eB2hpMhODaTx4dafHcad2GoARAvLDdXqlyftFJTDPrn4klT8
	ROTxJsBrS6sOR9wjmIwtM7JYTzEIwq46UGI4xIMfFBTZ+LQ9YFUiHZxnaIXRCNkiNPQVsUmCoIp
	d+m7F9QygTDZRxQIguocSkjKh2cKEeilRoyLNZRNFicIv2LaZDBpK/kUDFZP8K5Bo71l+R02+Bg
	8SwIfWe1YTIN0EMbMjyQvs2BiZdjQsS8VUnOb+tQDZLiMLuL0EkHghkEM4tlnpprPcdu+BWBNIL
	/WblLelMeKICeBSzHBdIjKcDlmoAPRH42t8ZriarL9c4ryiiGjHCdc=
X-Received: by 2002:a05:6402:460c:b0:6a5:f692:9c3a with SMTP id 4fb4d7f45d1cf-6aa53156915mr7823289a12.1.1790010483877;
        Mon, 21 Sep 2026 10:08:03 -0700 (PDT)
Received: from ?IPV6:2a02:8086:c99:c280:94ab:79a9:2843:6b2b? ([2a02:8086:c99:c280:94ab:79a9:2843:6b2b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67daf380sm4698964a12.12.2026.09.21.10.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:08:03 -0700 (PDT)
Message-ID: <c52cc96e-b40a-45be-be9d-775ed3dfe3dd@arista.com>
Date: Mon, 21 Sep 2026 18:08:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: Stop waiting for link status after config read
 failure
To: Lukas Wunner <lukas@wunner.de>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Sewart <jamessewart@arista.com>
References: <20260904111318.1063858-1-yurypm@arista.com>
 <apq3kd9_qsURNpKu@wunner.de>
 <6f916404-63b5-40a3-a429-befe42a08629@arista.com>
 <apvpr5Q6gu_3MODj@wunner.de>
Content-Language: en-US
From: "Yury M." <yurypm@arista.com>
In-Reply-To: <apvpr5Q6gu_3MODj@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/5/26 11:06, Lukas Wunner wrote:
> It's repetitive because pcie_capability_read_word() already checks
> internally for pci_dev_is_disconnected():
>
>    pcie_capability_read_word()
>      pci_read_config_word()
>        pci_dev_is_disconnected()
>
> I just thought that since you specifically want to bail out in the
> hot-removal case, it might be clearer to check pci_dev_is_disconnected()
> in pcie_wait_for_link_status() before performing the config space read.
>
> But I don't feel strongly either way and checking the return value of
> pcie_capability_read_word() is a viable approach as well.

I've sent v3 of the patch, returning to validating the 
|pcie_capability_read_word()| return value.

Reasoning:

 1.

    I don't see any benefit to using |pci_dev_is_disconnected()|, other
    than your point that it makes the code clearer or more readable.

 2.

    I checked how we set |pci_dev_is_disconnected()| now, and it looks
    like failed reads don't guarantee that the device will immediately
    be marked as disconnected. I assume that eventually we will receive
    a link-status-changed interrupt and the device will then be marked
    as disconnected.

 3.

    On the other hand, |pcie_capability_read_word()| internally performs
    a |pci_dev_is_disconnected()| check. So in our context, validating
    the |pcie_capability_read_word()| return value is more robust,
    allowing us to react to device disappearance (for any reason) faster
    and more reliably.

  Thanks
