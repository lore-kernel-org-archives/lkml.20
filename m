Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353891;
	b=YAqQThr7ezu4shLGf+FxTLUirpP8VWqRVasM23eN7R+C0iuBarUH4sort1nVUbOv5of4
	 qDTpJ1mKzoNiLHTx4bDAuguB7EJFKURWNvNKl9bsMSumckuibtKtN6TF46UX/uR/Bz1r9
	 6WMGKC0dXWmIxQ0rH2uiYyQm7F9zojxY+YHHk2GVfykXXfW0Zcng1+clOROjYbI6CTt6J
	 aqRtVkWSAKkPb8II8+mqou7EfP2s7F9ALr9NmVWfm77DOVakaN7IqFr1QFx+102DUQPQm
	 OcmEaEBqU78noTDTZ2Vg2HnqNNcP+sMqFGEm/T67WjZ57GC/VoZMF2Oi1Jrqstpokzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353891;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Subject:To:CC:
	 References:From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 Content-Type:Content-Language:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy;
	bh=ZuzL8N0vlppJloy/muSuIIAe2Zftz1tlLIt/FEE//g4=;
	b=2djx273MDkcBKNNMDLuh2lrAajWLNHZeQQvRaBOmRuwcFZlzlBz7gjmZnVW+f/Xe6kDg
	 TIlQKQocwKHC1SK9OGOvGSqoyZzu/uDogCsPkFRPnoDUZ23nAJ755QknL/mwaas8bKB09
	 9Mmt2noD6bt6Ykdy/Bdikg5+lHqRLNY7Gb2YVDMuF6fjO1qxFNe0nB3Gd8ZRKzsdAY0PV
	 bLFIweCvn5AgwItSROPn0IWv7Td3ON5jSL+MsZrRFEC9wV6Syl4iNB8WDYHI0NcYcUjlf
	 cIdJ17AQAr/DWjrtLMXYwOuSztGhWSdGXBViqrUbU960YkJxDKlN5iD5rKPNwuIX1Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0UrTyjyV;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAC606A32D;
	Fri, 30 Oct 2026 09:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AAC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0UrTyjyV
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZuzL8N0vlppJloy/muSuIIAe2Zftz1tlLIt/FEE//g4=;
	b=0UrTyjyVBnf6sKptfuORA4gghvLGNMWRrh5UmCN2USUQ+RRTVy20wvL5hedXymwwnx1WLmlT1
	dFk71RHUewofm7xwqA2BFLWPX8QPbMPw3svRB9+d+9tvDuO25irRK8fJMAYE4TiEDBzCQkyGonR
	K+fk3eRBbKlsBllNXL+ivFQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jGGZh3FNcz1prM0;
	Fri, 30 Oct 2026 17:51:24 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A5FF40575;
	Fri, 30 Oct 2026 17:51:26 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 30 Oct 2026 17:51:24 +0800
Subject: Re: [PATCH v2] Documentation/process: Add a maintainer entry profile
 for KVM/arm64
To: Matthias Goergens <matthias.goergens@gmail.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad
 Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden
	<seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	<kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
	<linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>
References: <20261030083351.3040604-1-matthias.goergens@gmail.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <cc52465a-54b8-12ca-ec5f-fa1aa1c0c55d@huawei.com>
Date: Fri, 30 Oct 2026 17:51:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261030083351.3040604-1-matthias.goergens@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200006.china.huawei.com (7.152.185.252)

Hi Matthias,

On 2026/10/30 16:33, Matthias Goergens wrote:
> KVM/arm64 has no P: entry in MAINTAINERS, so nothing tells a contributor
> that the kvmarm tree is used for integration only, or what the
> maintainers expect patches to be based on.  Marc Zyngier said a profile
> would help.
> 
> Add one covering the trees, the base for patches, the submit checklist,
> key cycle dates and review cadence, and point the KVM/arm64 entry at it.
> 
> Link: https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
> Link: https://lore.kernel.org/all/87tsnb2dtq.wl-maz@kernel.org/
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> Changes since the RFC
> (https://lore.kernel.org/all/20260925085621.562448-1-matthias.goergens@gmail.com/):
> 
> - Point at the MAINTAINERS entry instead of naming maintainers and lists.
> - Describe master, topic branches and shared branches; drop the open
>   questions, which the RFC's Sashiko review had also flagged.
> - Base: prefer -rc1 to -rc3, not kvmarm/next; leave conflicts visible.
> - Subject lines: capital letter after the prefixes.
> - Architecture references: prefer rule identifiers; drop the comparison
>   with KVM x86.
> - Testing: selftests usually at the end of the series, reproducible
>   performance measurements, tests encouraged rather than required for NV.
> - Key cycle dates: no new features after -rc6; how fixes are sent.
> - Review cadence: stability of commit IDs; answering bot reviews.
> - Posted as a new thread, with the documentation maintainers and lists
>   on Cc.
> 
> Steffen, Marc asked you for a short addition on KVM/arm64 on s390 for
> the Trees section.  I've left it out and can add it as a follow-up.
> 
> Oliver, thanks for inviting an updated patch.  Corrections are welcome.
> 
>  .../process/maintainer-kvm-arm64.rst          | 181 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  2 files changed, 183 insertions(+)
>  create mode 100644 Documentation/process/maintainer-kvm-arm64.rst

This looks pretty good. Thanks a lot for your efforts!

Acked-by: Zenghui Yu <yuzenghui@huawei.com>
