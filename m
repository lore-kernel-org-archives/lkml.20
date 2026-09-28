Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F5033ADAE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558847; cv=none; b=j9cFPB+qRW7/IXF/RjRK19S+gzYE1xRYxNKarDGiNCCcvfsQL9+GxGyh9iUTtVVUlZdNmmCUQVV4U+HGKqJvL9uhHJ3Km5PrPvVIAVn9F/HAnRlvdHAijFpp+xTufyJny4Bdlr85YIsdCW669MkwYATD+1Ay7EUuHd4mjccq2VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558847; c=relaxed/simple;
	bh=rjaNAg+z04eA9ykYVMKBTQouCXeaLXvohfjJEkPN/as=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2+H94IbQ0fAkg3uRYTxnm519hFpw3dVEUVqB6hExGpFj7eNSv9nQTsUQJsIiHX6SKkdw71wIokbpUxkY0b4ucWbzBt/zp2BT6wVzoZZc0cCMZ8xObp586SD59DRlNv6nXxep2T/F+x8SxH8oLTDkYKqW7ScORHt/uQU54k4i0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQ4aPz5T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M67KZti8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQ4aPz5T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M67KZti8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
	b=bQ4aPz5Tklr+4Jix+7lUH72KJKQ7MCx9AoASNuH6G3s3cLiFiAUqezNAiX8GTqR4lgmmoS
	QlDiRmPy+2XLfQz2mKnec6YdXrVqWqrAe7OopKbizNDqO65z/cC+usIjq/Z7hlkMVE8hr6
	Tqnd6+Tbc4L0aIo1o7USGNL2wn7/t9c=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-vIL29EtZPcuj3dHqe1etPg-1; Sun, 27 Sep 2026 21:27:23 -0400
X-MC-Unique: vIL29EtZPcuj3dHqe1etPg-1
X-Mimecast-MFC-AGG-ID: vIL29EtZPcuj3dHqe1etPg_1790558843
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8710450f731so1646645b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790558842; x=1791163642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
        b=M67KZti8rYwYeqUqDnK68Ddmffra5K+Z8hK0WqKs1Irlw0TUomOljwZ5IHp1GGecZn
         7YTj7WOn09JPiCwxTwjCjPhebsjN6XvIneY/cuUV+Iwx7gsz9+wN0qVGZPxaUhQ2EDmf
         4K9Nao4mquTHiHar8v0p1wVDw0GwPQ2+kgX7vzvZicSJaRQTVVsN3yBimjXkKr0B0ug2
         d9P6Np7GJYmHg4IxSICKC+sWiHbNzuQdy9BV0Uw9No1DhbZkR6LDINz5WE2UuCDzZIgH
         CmGNdxwZHNZHj36oI+mYa6s6pHn+Y2vlRhWz9/p7uQnmWIsZbbOlUiWt2KEw2FUzC3a8
         4xpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558842; x=1791163642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5votifnwitH8Ds1fhrux91JN6J8KXmnO59qVNlCSXwA=;
        b=E5gRwHdvP6EDoxQWSGNuFWlVkKYOVfvT3dJUyzHgx9qPj93oAWZ0Lu6hJyYbohn3wM
         3bh4tl3ZASmDjfe75LZMppc4hluBTc+0taEBcX3aHwhFzCSgSNIftq9eqR/xzI+UfGSG
         jaWllLNUxkL4qPVUTVD/ZcOzQDEBOZbMTW6kxwyy4X9GNm9cuUoJlAbbUOTL+/1GqudH
         Q2QaA1H80GkmnLAw55P8mah3qMvYONUT8sD0hn4cBfM92GgzneThh0Zi/jtSICJMPnHZ
         rk88YU76x/Avvhnk1+r2AN7nGyeWdAn2vaucljj9jkLzD5rQhqc0CrK+u1fboEtDR695
         BduQ==
X-Forwarded-Encrypted: i=1; AKwUvBzctO1l71k4us/N0o/CYHSERsG2iTF+z0vSg2b1Hp56ixosdVgynRWb1rCsj9JT9vQ9P7fQcF7oA0nRVcg=@vger.kernel.org
X-Gm-Message-State: AFuF++l86LckHbdGSgt2dbXxhYwpeJYxv2vjnDt8LcuEzccSoC1Sfan+
	4/Rf1bTy5ANf6RVJ91VBI2ntkSKDRhxjaKO5IsYJbR0HRkPiq52ZSQQV2IC/eeRrP//RlHC7+/P
	reoDrGv/r0f5iwf6xuPxDxeZ59/S1divvkcgAAahySZVldkEy1/e2+jfPIbKzfDwt8A==
X-Gm-Gg: AYBFou0g0tOydkzclO84oNRMzS9EdWT+R//JdB6j3iLScsEekBNmsoUCAIjCQ4WqWbN
	TO985Z8AI+CpJ1nYRkXWtV7UgvscGZXV1bHX/WSsABmAzgvEjEKj4s4yuRg+UbjyIkU3SVcQBxh
	dtIsy4guZI0UnybZtP7NQUAuRhck4BodXbqQFY82bUGaPuHnyxeY58dVHPERPO0XWyUXuf/euse
	T3gmf7oubnVYWyC570S3eh5NiHldP80qMkclqU2u8F0uJe25j6js8AxgvKohHG0t/JHhj9oVbWw
	ePtovNbNBQmB3PPLyfbg3Vkg9a2rzoisrjjqLBgmH0bOxKt1FiJuKkUfyRPB6kZEI2H1NtGXuHT
	mrnOKFHTe9fa0tww9fK++TeT+8b6xftxFGVueUY4DXw==
X-Received: by 2002:a05:6a00:3d06:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87e9aee4a61mr9245884b3a.17.1790558842670;
        Sun, 27 Sep 2026 18:27:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d06:b0:869:c368:3675 with SMTP id d2e1a72fcca58-87e9aee4a61mr9245873b3a.17.1790558842219;
        Sun, 27 Sep 2026 18:27:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882d579ca0dsm907806b3a.21.2026.09.27.18.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:27:21 -0700 (PDT)
Message-ID: <2c7a9780-1846-4b5d-b743-42ee1bfdda22@redhat.com>
Date: Mon, 28 Sep 2026 11:27:14 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 14/20] KVM: arm64: CCA: Add bare minimal S2 operations
 for Realm
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-15-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-15-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> Add bare minimal MMU operation hooks for Realms. The mem_abort handling
> is chosen as the default KVM variant. However this cannot be reached for
> Realms yet and we would need real RMI command support to make it fully
> functional.
> 
> RMM takes care of the TLB flushing as required, when the Stage2 is
> modified. So host doesn't need to do anything explicitly. RMM doesn't
> support access flags for the stage2, even for the shared IPA.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

