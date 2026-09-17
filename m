Received: from sg-3-28.ptr.tlmpb.com (sg-3-28.ptr.tlmpb.com [101.45.255.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108BA374185
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789610744; cv=none; b=YnBnK7ar+J95CncEJ0idlU30jEwUVMWbdXBgvsYi4d2CqXcqMcvHPWu/b4flssqusz2lON9rCIjZuPnjJZmcSos7/BfJiTmxJLheWGhxGfIyiI/pA98NZMdxTCedgQs2+2yYIiMT130fL26CFqPe5i2Q5lhXOq4heqkdRHRf7D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789610744; c=relaxed/simple;
	bh=Sxo18wVPwpf/v7g9jFtkgFrSGUWSgHhvfTGebiRsIiw=;
	h=To:From:Message-Id:In-Reply-To:References:Cc:Date:Mime-Version:
	 Subject:Content-Type; b=j93DN09Xi4lJXksGIveLotvpXgdUzHJWG04NThvJrbEpx503zCla1efkxLomVANWvr2vGX75dv1lLFvVEI8dcJh3YAbU+QI9eJghKyVEJRlh38C/SqUw0UrsBnufXu9zM/+OIWCXUsgsPKiAkurNjmgyZJfmjH/6w3BsFXJ2B1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=mTqXAqnW; arc=none smtp.client-ip=101.45.255.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="mTqXAqnW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1789610690;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MDsxntRODNgCNG5JeXxth+hLjZlO+v0hDLmbatGO5VY=;
 b=mTqXAqnWaPFcsNiK+cyRsvkef7ovWgv/a91kjHhwtxxi0rz3WkmSgPKAb9tPxHu4cvsg7l
 WPqFKWE/8rrtTXoJZ5FGUQ362TxDT/psZkJIsZAKOPWWFGkRbrWYHDAQdmQ+m3jhw7Tac5
 V/UNueXEyE6eo7zK849y6ndNjtaInWuCCW7TqHQj4/ttpXgOdl33IsGTJtehb2FhwIPSUK
 gETRKnwLg048G5crunUBk+XxN/Lnl7dBwwPNDK1oHRgQ+gnEW+et2Ww+ZjQIziI9UKsYCj
 eFIeEizEg48VTZFN0XvxwJ2KlPenZi2TBoPJF8d88unoRFxVZ8eySU+wuSuTtA==
User-Agent: Mozilla Thunderbird
To: <sunilvl@oss.qualcomm.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Message-Id: <9d469f95-73b4-4a0a-9c35-80a655a53225@lanxincomputing.com>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
In-Reply-To: <CAB19ukHfFXmuPEaWdNPvFRkvMGpDQfVEpCHfqsHL20tpBytQRA@mail.gmail.com>
References: <20260916112545.887461-1-xiangwencheng@lanxincomputing.com> <CAB19ukHfFXmuPEaWdNPvFRkvMGpDQfVEpCHfqsHL20tpBytQRA@mail.gmail.com>
Cc: <sunilvl@ventanamicro.com>, <rafael@kernel.org>, <lenb@kernel.org>, 
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>, <linux-acpi@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<iommu@lists.linux.dev>, <tjeznach@rivosinc.com>, 
	<luxu.kernel@bytedance.com>, <guoren@linux.alibaba.com>, 
	<jgg@nvidia.com>
Date: Thu, 17 Sep 2026 10:04:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Language: en-US
Subject: Re: [PATCH] riscv: iommu: ask for ACS to be enabled
Content-Type: text/plain; charset=UTF-8
Received: from [127.0.0.1] ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Thu, 17 Sep 2026 10:04:37 +0800
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26aab4ab7+977e05+vger.kernel.org+xiangwencheng@lanxincomputing.com>

On 9/16/2026 8:18 PM, Sunil V L wrote:
> On Wed, Sep 16, 2026 at 5:15=E2=80=AFPM BillXiang
> <xiangwencheng@lanxincomputing.com> wrote:
>>
>> Make sure ACS will be enabled during PCI probe
>>
>> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
>> ---
>>   drivers/acpi/riscv/rimt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/acpi/riscv/rimt.c b/drivers/acpi/riscv/rimt.c
>> index e4538fa6c2c8..30d2d0211d5e 100644
>> --- a/drivers/acpi/riscv/rimt.c
>> +++ b/drivers/acpi/riscv/rimt.c
>> @@ -525,4 +525,5 @@ void __init riscv_acpi_rimt_init(void)
>>
>>                  return;
>>          }
>> +       pci_request_acs();
>>   }
>>
> There is already a patch in the mailing list for this.
>=20
> https://lkml.org/lkml/2026/9/3/1930
>=20
> Thanks,
> Sunil

Thank you for pointing that out. Please just ignore my commit.

--
BillXiang
