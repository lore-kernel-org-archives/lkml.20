Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331D1345741
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792994; cv=none; b=ZiWAkmRKRZr+3r8MWsTFm1m5MOfnvDw3NhRMg7wTf+mNKbc2mUKw3M3nAxy55hh6bUDbAaIbxYrsw+k+riS+P981/wGhTMb7iov8oBtmFG0PuTkFZ+cmjBO/knDa0p0na6lsNTF/ihvtlkRqy23WBIVwfz/1vjl0D7IkUrnrKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792994; c=relaxed/simple;
	bh=Img102ql1PULexkYdUB8b1kBJelDdamz3bBb6P44gT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eV9bV7bZLdyMyHS4CtKiGl+TCuJ2aUnG6dTx5GF9Rk/3NGRMsa8IeiS89JFUrusWikLhF7gxb8Bl8k3YaQrvNqUr+cIFlwO6hMZGP9WOMoz1kZFNqvyl0UwvxlSIGzXfwFpOmDyip1qj9j7UvDiMG0arz3ONJ6RWYdMKECqo3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DnlVoZRA; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DnlVoZRA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=81IhHyoU6o75YZNvT4lQCfAnBFAlCeQFeHrciGVuTTw=;
	b=DnlVoZRAJGd+ExC/c31OBDbBLYieMspGIJYBt3h63UQpCb8UwtWtuJQoX390BB
	GmgeCUsXWdY9J4BCPv/WbYlucWzxTepe7nAkqnqOJujSGKRhHCpDLauQP4MIqbyx
	twgZDgaIEm6MtKTpRTrs+sueUuZiR8jq5b+5NZfDzIoXU=
Received: from [IPV6:2409:8900:1a87:d0a0:cf38:5aca:d24d:b7a4] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD37zMwl8xqsV0oEA--.10116S2;
	Mon, 12 Oct 2026 16:15:46 +0800 (CST)
Message-ID: <a3089379-3741-4602-9e6b-d280b1236dd0@163.com>
Date: Mon, 12 Oct 2026 16:15:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] ntfs: persist Linux file attributes in an EA
To: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev, linux-kernel@vger.kernel.org,
 chenxiaosong@chenxiaosong.com, Baolin Liu <liubaolin@kylinos.cn>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
 <1385152d-9e3d-46da-9a3a-299ad60d521c@163.com>
 <asxlX7ysgW7--bE5@hyunchul-PC02>
 <CAKYAXd9JuxCHRHnV5LQRgeQe91XHcG16UNTsDc4bwBo+RoYpHw@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CAKYAXd9JuxCHRHnV5LQRgeQe91XHcG16UNTsDc4bwBo+RoYpHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD37zMwl8xqsV0oEA--.10116S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUn6wuUUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hK-imrMlzLe-gAA3u



在 2026/10/12 13:06, Namjae Jeon 写道:
>>> Hi Namjae and Hyunchul,
>>>      Are there any remaining concerns or changes needed for this patch
>>> series?
>>>      I'd be happy to address any feedback.
>>
>> No, I think he maybe have missed these series.
> Sorry for missing this patches. I will appy them. If there are any
> other patches I am missing, please let me know.
> Thank you for the ntfs work!

Hi Namjae and Hyunchul,

   Thank you for your reply and for applying the patches.
   Thanks again for your support.

Best regards,
Baolin.

