Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792788298;
	b=VPmlevge7q0wP8kDaDhvk0ZQWqekjX4amuVK/qBB7HcWuHnAVCSMUJdIPCDguLSASZX0
	 YXHecL04UdJvqt6hm+iKxDMIQTeruYs3/pod5RvkUAnVwmQNu3r29LtPDQteQQ2eQ86sN
	 kfPnLjHF1lU8yZuJgJFDDsOYTeRUehocp2ouQXMLDMi24cJrcBcldZ8bA02+GZF3Q4GsD
	 GnpQuPVK8suapCG+w5t1R5a7H947TW6qSsjwCY20LRblSphe8ze9/YYdKz5FieNvlnB4P
	 5u/oKjO7x0I/X7nrk/7JcXlfB4OFn6djS121l4A0dm99MLR7qTAOqcYsaTA9JG1/MDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v7+u3dOadIrUbFkNlr6wXd/ZKqCuBSYy4INtLRXYGUA=;
	b=RcJjSivOXVdbmOUByRMMTEn3nHxJDRoJ+2pEBdi4Da1YApEFMhiIASuknJ4ZhRcx94AX
	 ca0bqV7eS+fpAmm26PAKvKhA487CX/1+jTZz+XBSb4RioTpT65rPMbqT11M2MLcXRzlqA
	 hQCmYBT+s8w/5moH0yzlTUf3JfwLM4e2gmZ+WBXpWIYX3khtLwUUH/T4Tk6wGziv8s00H
	 4OAvCmqR0/GnnBSBXiSBk++qyDceSjOyo/fEpf/+VmdH9To/EbkkTpirJxBw3tQ0nepHE
	 I3UTG5wY0qNwtncfc5X42PCiL3dAI95KgzzRouVHw+GKv39sBwtgzR3WVkPW44nGeog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q+Z1RtH6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF208606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF208606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q+Z1RtH6
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so1365039a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792788296; cv=none;
        d=google.com; s=arc-20260327;
        b=mixH2Vo+6T7K/KEgdBmuNR8Jkj62/ia74wt4fKCmveSSfdy+7OmtRsL8YYA4weMDnE
         DhfXNYueSrEWa82+8wovcm5xdmZzJ5l+5sZO+FOYS/D0Y1AMFTG4OKHET/5eKc8G+auv
         KdNXqcQPZ4B8FJgCwjXn/LtaflToEqKjvpPokQRgK4vUgDp+F4o4iRRFI4O6JakeNHV3
         +NWwACCGLuiwDs8SfotFIgH7SCRj4vzjZhIN5aodYWj8kArwRQIOLHtj4TSLVRBLofcC
         AJpeWhiXIRPKTgjZCZ2Wx1/TUVWFmlT1ajkYXkdgvcnAgN/YKgtSNLqgLI9dGzwa2wYS
         RfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v7+u3dOadIrUbFkNlr6wXd/ZKqCuBSYy4INtLRXYGUA=;
        fh=r9lNobcof0zBEOB7CgUQOSK4+Y+gtdyG5wnqO5E95Nc=;
        b=rhcxOt2C/y7aGzn0l/gZ/i5F0R0AHqj0lu6TsgNag5xDSU3dhVCQ1c+fwenaii4O2G
         rGjxGeGUvhIXL5XdlcApef2efaaigGXJddp84MLBdky6Gi+xlVENMwcCciJyDLGDFpnZ
         FbCf4GVk5d+5RaJbQqtw3ZHZhg4JNOngA6iXPJX5SPE/Jfnw378aB7H1VeeSWu6ZmBs9
         QcMpOh7t5sIj7ZF3XHWNpl2802j3n+xoqr+/enhKS8VF/PSqRZJNHabCTWExkNevE57O
         A5CVApVWtG1kZh1beakdLgMwDQ1Alm0b2n0sV3JRVl9Z6waBj/cA606JYWe2RKxa7Qib
         A/0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792788296; x=1793393096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7+u3dOadIrUbFkNlr6wXd/ZKqCuBSYy4INtLRXYGUA=;
        b=q+Z1RtH6uNQdMh0T4PtQO/WO7RCPyc3vSbx0tWFh7pu70R8Zby0afO/WZQMBQh3sYB
         DcarO+aJd+zkxJ9GpTZbjy0mKQifGR+kUWtTGxqE/pbZAgBhlK5VFalCIIbbsOI/vVlg
         hivuGBHWnK+z91xnbGNx5o2HLCxIM7OIWt4Rg+9Nu+Rb/j1A2RLoN0Y703Mhl/1Sa4qZ
         82UA8Un3QoJShNJWge1vF4HBcT0ny2obOC1X8glP0NbCh0XsLbDtqsjOipNKUN7WT3w6
         9YRVUYrjDM9070B1D+sccTLv05a1CQ5axYsuRjO3ZEaEnlkLnHaw1hd5SBq8N7t0nMrH
         4aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788296; x=1793393096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7+u3dOadIrUbFkNlr6wXd/ZKqCuBSYy4INtLRXYGUA=;
        b=o4t/2gkg71ODM1xDXeg3JBJlSywYF3CSqhqM3eSj/7uk6J1MdrDdyRqT2Ug3lQhWDt
         boWeW2TDcKET01Vt1FtVSXTJp4peidWXtBeas2gRsCNihdYnCCg/SOOK8oQxAqaxh5lF
         CeIQzEZ2Z0nIv7lsQ5J3AznQx8I/M7ODfziktUNMH/9OUT5wkCCnJu5Ei6Ve/bXEIi2j
         XIlSMdMWRX9Su2eXXhHwDmKYSbAiwHE2SYNT9UcUq7RxlrjPoq2OgPs/OCC4UOuyYWCs
         e0v+OIgHGfhEMb87VLNYXJ9HRZDlqusEaOhUeVmvsfFnfUaEY9RlgTUUVtarAQJrA3fg
         U2ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/vsxsTXGg7dq3/XfdS+7fUJvyc8pGV/kg3iLndDExIrLMjS2wTyIqoOXr3ZYPA1bpZ/6E6B7jeTq3spM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzPQfX93CUpjOSv/GhqPJpSzqhui+cVtfohuL0Iof4u8uuDQ1U
	YtpiFNbwzIZG9KTGQX4FJW+j8NtMFfi+oQDy4ktX+XNjijSnJ0S6XwAGhc+lHmpwwlYHTX15D7e
	xmlhzDhpWGvSg3sLTIZjbvXrSmV0mIZU=
X-Gm-Gg: AYBFou0dAOjNea0Ruj6DgMHJo48j4kjLesDiFpxOOsKxHY5tHI9ddHGF+oROYopNy19
	ncuia1CkgQKSdkBCFgPy00jtpQwY2Rl3G1TRG5op7ZRhj+3b7nZNdmpmgsbgUnUsosvf1kARHY5
	AeUxOxQf6ehcrrdY6hLX0ATJsjwgFMWpJkucTsTCeqENJ3fZhwTAWnpDT3AsVxhciqb6c9fD6tt
	+eBEnLJAd3nS8mwqa4A6Z+DpW3hGhW7kbuMBPRtnz6Jxu4bToyK7cdUxepmKZSxLuTdsK7URpDg
	QHVOyMPznv/sSo06DVQtJsL7SmklvSlNlZXY/hxzlr4HCtV5m9fYTSV66xhiM03LQi/Zd1vVlHc
	qD2Y4QxEv2l7ENhPwjcB8dz2A0oWgYT+KqdiDvOxtrYAckAfZO82Ve9o8GI0/VYNkBZSpWFFAqZ
	YBgYr9rPtWi/a6IDBWVaCZ0qz6McAHD5p4dM5WEX6mFxXik69/QE6ZEaIzsFEsZlgG5X9YA3OSS
	NhJfiRPWYN/AlNl3lALlz1wbxNoSw2uniPuVm+avbkaTaIk+w==
X-Received: by 2002:a05:6402:238d:b0:6ac:8761:17a1 with SMTP id
 4fb4d7f45d1cf-6b44300f683mr269474a12.36.1792788295986; Fri, 23 Oct 2026
 13:44:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023190653.70741-1-rosenp@gmail.com> <20261023221424.2722795e@barney>
 <20261023224140.465903eb@barney>
In-Reply-To: <20261023224140.465903eb@barney>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 23 Oct 2026 13:44:44 -0700
X-Gm-Features: AclHuK_iEVqXQQc71AZ8oDUrqZy15oWTBltW_n805CdkIBNoTMIbMWBdIoDHNgo
Message-ID: <CAKxU2N_1XgjVPdSrCMYzZx4Rb6yjgEe7kBZYyG4RASyBv5BtMw@mail.gmail.com>
Subject: Re: [PATCH wireless] wifi: b43: map the RX buffers DMA_BIDIRECTIONAL
To: =?UTF-8?Q?Michael_B=C3=BCsch?= <m@bues.ch>
Cc: linux-wireless@vger.kernel.org, 
	"open list:B43 WIRELESS DRIVER" <b43-dev@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:42=E2=80=AFPM Michael B=C3=BCsch <m@bues.ch> wrot=
e:
>
> To explain this further:
>
> - I might be wrong, but this patch looks completely bogus to me.
>   Why would this be bi-directional?
>   If this is accessed bi-directionally, there must be a bug somewhere els=
e.
> - Please provide a HUMAN WRITTEN patch description.
>   This is really important.
>
> I am all for using AI for development.
> Especially for such old and legacy code.
> HOWEVER, there must be a human present and understanding what is being do=
ne.
>
> Please slow down your submissions.
> Think about your patches before submission.
> TEST your code before submission and send evidence of your tests.
All code is tested on an Asus RT-N16. It runs on non-coherent MIPS.
> Untested code is to be rejected.
>
> --
> Michael B=C3=BCsch
> https://bues.ch/
>
>
> On Fri, 23 Oct 2026 22:14:24 +0200
> Michael B=C3=BCsch <m@bues.ch> wrote:
>
> > Quite honestly, to me this looks like a lot of AI slop is sent to b43 t=
hese days.
> > Can you please slow down your submissions so that actual people get a c=
hance to review the stuff?
> > Thanks!
> >
