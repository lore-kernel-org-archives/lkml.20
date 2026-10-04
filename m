Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3633EFFA8
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791099903; cv=none; b=bhImjYl2sy4sRqT3yWUQfSfRSeFpk5i2XZ5MhuXU6MeG4/m0mErb+8Puyo3SYXW/ZxkYjdDLx8s0Z6K9RB4lXGBMgR03Wp33hcA9fmxVpPl+AeNbcNUn+YHHjRnukns704ZTqCNAP9+eaMgsjtiCvNd0utSEC35o0K2AXP1OAsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791099903; c=relaxed/simple;
	bh=LH1GecQtlkHT8+GJtLwyFUPsnNws1QdEsUcKa8sllyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z4YYvqat/5KmqzaUADON02oDcsyxJmXJOuV/wncpe6c4oIqCrZb1ZufFtsCnaBahuKxaJWhr+rxDun2TEEYW/rlrhnwv26oKAUZQ6y08D+PfMOQ14KL6k8RKHVRXdiUOaEzkuO+P6fbKSdiIq7tqDpen1uO2Izn3gHntaM/kXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKXS+a/q; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKXS+a/q"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so464714f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791099900; x=1791704700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FyC5sPpOAH+FSBovRm2XZUfS1Syw4tOEDqAC5MeYbTg=;
        b=BKXS+a/qIcmHUhy1VdbUyVqRg3eWWrbsPkyxw/oASe3AK+vDyWNB7Kmh+yQtkOdc+G
         Tkx7Z8klHF3ob3Lwudf0eGYN+lWnkyB+EfFHryk232ST47Mjnf/2eYUCquRcUO/WcxsB
         FPgmLPieKkoxltUl/eAUc86gQZYSRvqEnOZl2EK3un4ZurA80p4RbBZyHtCU6C1b84a+
         R3DLaKR1SnCT9TwVHsaeZQYasFnqpJQERrYa4+pBGmn2OrE3KPWEKH4Ec9RDdI+9l5Yu
         uH+pJ0gV6ym7taF12x582zcmxF6CEvb1cZWjxyzugi3iQ7HEwTOCBwd+1RFfhziRfCFV
         /tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791099900; x=1791704700;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyC5sPpOAH+FSBovRm2XZUfS1Syw4tOEDqAC5MeYbTg=;
        b=WyoFhsU7sCeae3AknXpd0+dqWWw6wCRb2J/6FDtmrBwervQBLnnyC2sodN9NrwuABa
         ck9f9k7ebJPNnMDhNV9NchLC/Jfc1Cp8SGfj9bFP/p2K4VarIF/3Fe5peM86e6i+m4BT
         0C6xl86gEYbp7Nk9U/wTK2UtkOfM6aMxzqMlmi2YmxYUgvN8sWhBEdfSHH5ghgJ0UdSU
         vnriiYBVXa4eS4RxQvfmPSp0jWC9BNQ9zeVr+WQ7cC4GIiQlyVztq61rGLH5cN/kd1kF
         sdP9R4nQnkfdDorVAlhX+1gKt72n//2YLxfhg1taQjPptLTo0s8chQokliz3h561l8WM
         +Byw==
X-Forwarded-Encrypted: i=1; AKwUvBx+JorLqM1NrTnUkajD90AtcO7r8EiSI4LLWQwKFd7BYMJyCNsUXvRf2IF/d9CyFp6KxCk13RnZrE8aOB0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyoSjGAs4X9glcqDq+tKK4n4z0saNupDkvKumYJ6YqmO0NGfQc
	jXHovj2vDgEkae6W7ignEM74QRFcdRrsjsh163JgwO/gjSNRStyKrF9Lq4iPRG8z
X-Gm-Gg: AYBFou3IjWpcq9Fkf8b8kC0JqSMvN70YY23hLNDzZnCk4rxGAHcVphwDMA9a/Idy2B+
	mnem+2tfopqNsdhNgsAUmX/vyw/Ei5htSzVr4OoXZMokTM1/UId3FBvGlztcMaoX+KddTzP1M3y
	JfPUxjNSQwO3svQNc9Oqqu/9J5WXz7dDgKQuzIIB3iXZ77RckkCmpZKplC+qXvL3eDrSA/m5PDm
	iwMfemoB8S9HHuWph9PFh6Up3c27MmOyW21QJhDp06Wp1y6S99zX8oL6abokhtC7qcxu/4Nlkbf
	VYcxE8OP9GBvHRKcPBfoqp6qd+eyWsT7lHnQJjzucUtkhwo/SUlijX/+fMFkEOEhFdcnkWWW735
	I3b53NeGnnlgc4FKKARq1lefsYoadckOAtjtEW/2ICdy1oeOJDE0Auj3K9gNPN4pY11tzsxxHgd
	DvVp5OdntlYoOMuQLG7rJdZqcznBhR6Z+hvrJ5XlHIZWQ9jHlefpff4alCLH40gBCh90TPU/ERK
	XNVgL0a6jdZYiKZHBj2ochYBwaFkk8HQg==
X-Received: by 2002:a05:6000:2906:b0:48c:50db:30e3 with SMTP id ffacd0b85a97d-48c50db3637mr3761914f8f.19.1791099899719;
        Sun, 04 Oct 2026 00:44:59 -0700 (PDT)
Received: from [172.16.12.104] (ip-77-48-235-10.net.vodafone.cz. [77.48.235.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380faaf9sm17646858f8f.22.2026.10.04.00.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 00:44:59 -0700 (PDT)
Message-ID: <d737b17e-7872-4afb-b4c2-bfa8f4e119df@gmail.com>
Date: Sun, 4 Oct 2026 09:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] dm-integrity: support keys in the kernel keyring
To: Eric Biggers <ebiggers@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>
Cc: Lorenz Kofler <lorenz@sigma-star.at>, Mike Snitzer <snitzer@kernel.org>,
 Benjamin Marzinski <bmarzins@redhat.com>, Alasdair Kergon <agk@redhat.com>,
 dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 upstream+dm@sigma-star.at, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
References: <20260928062734.3805458-1-lorenz@sigma-star.at>
 <20260928062734.3805458-2-lorenz@sigma-star.at>
 <6e7bd72b-6f1a-211d-16a8-a35a530af408@redhat.com>
 <b0f8f47a-beb0-426e-bdee-5d0d80ade8ad@sigma-star.at>
 <1e53661e-42f4-72b2-3331-33af21e9fe0f@redhat.com>
 <20261002201419.GA205250@google.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <20261002201419.GA205250@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 10:14 PM, Eric Biggers wrote:
...
>  From what I understand, the point of the keyring support in
> dm-{crypt,inlinecrypt,integrity} is:
> 
> - To support "trusted" keys.  But that is not what was actually
>    implemented in dm-inlinecrypt.
> 
> - To avoid having the key be readable with STATUSTYPE_TABLE.  But that
>    is not what was actually implemented in dm-inlinecrypt.  Keyrings are
>    also unnecesary to solve that problem.

There is more to that

- to avoid key cached in dm-crypt (or other target)
(dmsetup must be able to retrieve mapping table in the form directly
reusable for recreating DM mapping, so raw key must be available)

- to avoid inclusion of key in DM ioctl calls (mapping table again)

- to somehow simplify keyring handling was used already by other userspace tools
(just reference existing keyring instead of creating new one)

> 
> - To cause security bugs such as https://lwn.net/Articles/1090568/ .
>    Since otherwise things aren't exciting enough, I guess.

:-) But TBH, this can happen in any other subsystem working with keys.

That said, I see keyring as incredibly complex code with complicated CLI tool...

Anyway, DM targets should be unified.

Userspace support will be tricky, but that is another issue (we have full support
for dm-crypt, dm-integrtity maybe requires some API changes. Will check once
kernel get the support.)

Milan

