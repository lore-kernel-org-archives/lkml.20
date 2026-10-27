Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082088;
	b=H9RTfIikZRfDQWGp2wbvogFrLx1o1g2IlDeUSSwYWCRLNV6/6ha0fhMpOdcWGClRzzre
	 EyZZ9O9068LlTP2Txo86rHGbZ0vkGgQ6+1FByMbMngzDh93shqTO1tJcNNkh5M8vZOV6E
	 MfJYRxRFQcALgN+JwFxKKrglPfnw9DopX74e6SMqIXFkqvc4UB4KrgK/wQjkZDjJJS+Sp
	 TsFNVXpo97/6cTu45psw6ZiuYteHI0iK1ihZeAjl+DWZRxKMrjNBATxC32NZyL1GKKAf5
	 1dyNat+YpSpnJ28i/zpl/dbRwH+JCW4ccTfXMRZiRFLe8wqAkcPCN8AFF7sSK/XaLAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082088;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=l9ItIO3RAqtM9QI15WCRAxxgeyUZsdZcJ6WEzUfQrXA=;
	b=OK+d9Fwtz7h59nUJ0b1FuKpLudUvvl2C9E2dPOfdzudF+CmcRuvo03XBKP0pZLMYu8t0
	 8+SceTjpmCkY/mLjOPLZCXMDMQg2C4cUZxOwfBImEWhFcj+98uyFbJgEGGqRmswm6g7Wu
	 dmna/PbpmpUDgKtBNV3Cmj9SyGQpRWgeo5Att+QsM4GicaoSXpAfTFC+CsrWSmW22OQub
	 54w2qGP5PMfBqFCQ/TrRzgJEajrzxj7uj6Vi14bLeF8IVwUixrkflXz4BflhPr4Sp94MJ
	 ZDnUVaYmhJSPK00lRxZfHZlYYw5mAnlZO4UybDE25ZAlGg7Th0IH1VTNGcFMZ3Cs4rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bEF8MrZP;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67765606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67765606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=bEF8MrZP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=l9ItIO3RAqtM9QI15WCRAxxgeyUZsdZcJ6WEzUfQrXA=;
	b=bEF8MrZP/kd60zSJA8VDG3qeInKhYMvsoDCd27xqMRDzZwnmtQ3MfyU4R1HoPH
	LEJpEkOIRdojfPyWPeC4PEKyhY/VunLgpQ87gNSqE87zP+L4YjE1fBzScaOwjxG2
	OT8dfzKVzYUSqInCWtHRZtKzjnGvvcA13yXpvWVp/gMHQ=
Message-ID: <fbf185b3-e546-4d37-afc9-9fb509fcbe34@163.com>
Date: Tue, 27 Oct 2026 14:20:49 +0800
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
Subject: Re: [PATCH v4 28/31] ntfs: report EA metadata and restoration errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-29-liubaolin12138@163.com>
 <auA734yJUBRQPQD_@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA734yJUBRQPQD_@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3h6LBQuBq72NfCQ--.28847S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RNEfoUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QKTXmrgQsJKWQAA3-



在 2026/10/27 13:51, Hyunchul Lee 写道:
>> @@ -605,6 +621,8 @@ ssize_t ntfs_listxattr(struct dentry *dentry, char *buffer, size_t size)
>>   	} while (next > 0 && offset < ea_info_qsize);
>>   
>>   out:
>> +	if (err == -EUCLEAN)
>> +		ntfs_report_file_metadata_error(inode, err);
> 
> this function appears to reache here with -EIO or -ENOENT.
> 
Hi Hyunchul

    You're right. I'll check the -EIO and -ENOENT paths and fix missing 
reporting in v5, while keeping normal absence distinct from corruption.

Thanks,
Baolin.

