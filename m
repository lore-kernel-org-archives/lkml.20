Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC938562613
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933105; cv=none; b=eKOFKTYWZsxWRiJBnuUbdfthnVIhTBSrX/4dSZOF/WRD2EdiEV2gTRR/Wz2wwks8GOfAfNBdxDjnXFjTBNBN7lMkXphy0/DspFvpK/b5/gWUpPt5k2KXsP8ZofBNjdIW5M075Ez3uyySuunLTsSyB+wgtSRSjqmRFGZlGSwnd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933105; c=relaxed/simple;
	bh=w3fOXhyHupEbF+1KEAw/P+OGpHKOZQARS8fKM5MT5Uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JE/lYZtkTnMpR0xqcZJ4hNV8KXwNwmDHKRCPBRvvchwuHsBjRdU0HysdfQx92QvSiK2uB4ipc6s4YWX0WXzzwqTOuCuzC8McYrzfI7kJ2RilLFBCpYsxQDM/YWpYoe0mMEK2PfQjWLiCKwkU3PJxNBiI1AZTEn5swmzXANUMWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=XB6gOWbJ; arc=none smtp.client-ip=74.6.132.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="XB6gOWbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791933097; bh=MqOTRBmtGCN5G/34eP6Fz2BuE/JTLfPIoBPz6mQtcSA=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=XB6gOWbJVBLXIb9yDGjl+sHblC6vW2jd8L1J92tqILPdBqCMMQye08PI9uUPHENrj0WJasbyGhLqUZg6TaKcm4k/IRzJVGLNQmiuDzexCdf1rOWIUe2OR5iU3R3nMD20dC2YTJfxj1w5wy/7/AhfHmgfAiBOMAJnCbfh3UZDSuMZ/RW1arbxN5CiwNc5y2kntBzI+ilutNOKIBXeKwHR6UxagC4hvOWlOqfio/Vfx39YQlwziLA1JkwjYGuIbNVjzW3jHCj+iAgDQf8TUqdkaGZvw6BqByBQRzqUO4bzh1+SmbE9wSX4YqIRTD7JbMZS8ABmZWKijSKcmxxtisLaoA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1791933097; bh=9cHZKDS2xcTq6VGfG5BzbYJ2LZ2S5zFAKEiJlCCIyVI=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=cEVlw3AqnUjNuJrsNb9rvgC6xLTjQ0JR2p88UMtE6U6rdmJW0XHqZnY+/b7E2UKJPhudaKbrB8y91WH8bIW5bLfsoBexlUf4CO9kXi6vklAsqqV5h8N3kvpTj1s9KQ/LArXpOcGVKGZwlJCeC7dX/wCdxBUQwDSJcdFUuDInYh3Df6NUVK7GndsDUjRhdWbC/3t31ZZYinnnqkAxvNd0KwGubaqNBpG1YAY9ZLkTF/8PAK/3XYHT0lSlvBCeZGT5vlJE2M9nWQBBsfV7zfDulkYcqAMOuzvuRVFLSn+Q9q3aCVHgmRlqSgpWVhYi78qj9dv33fixhI3M9wKfwnTVIQ==
X-YMail-OSG: 5Rih_4cVM1mVSO2m0SdjKTtXTIxtoKWYka9iFZYX2LaKHFp8Z5zl0omiXA8B80y
 NV_fsFGlqnAH9OacYn6UBGMVSxv6vwOdAOAq5Z20zsXOkx1DdllBmKyO3SbXhnDnWONssK0iJz5O
 u5EUPjHm__exEk72uVyoiw.41DCMDElewVCfkg1LTxJKm4QR9bYKvxgMtatpV.UX5dXN9tJ8jTy6
 DSCbQy23hKCE7xxEl4_4L0z9DV18yDvDFAQwAJgRCWUStMA6Xu7NNLPjmtTvrrCG2MQQV0wky.8L
 xg3_97GY8pfPdA9pOKhcTD5KAaVyDkv1MPq9Db65w7nUfyjKu1WkbKMvzeDYjV4BKycw3yjJ3IY3
 xNlXJuRHqzU7uJJMIwo4BqWIrpRBHmD1yZolulZUspwIdTpkRFo.MkeOrCXnphXvyllZNCl71YmT
 tX2EGt2gYRfGZZxQClKrlVxo8PRXTNSq5cnQSiMgZBbvtmfUpNoYjreVgAwlxYpbSV28obcRFHMB
 rW0f.zF3W28.bOt_HLSrm9uzDXaCQlXKGUCxMORqmRwi6sDnYVbsYuxGKRtptfw6sD5UQix7G4Hg
 h6z0a77Srt1qCmZ35PROpX2PkLRlG72OYHoXNLK3ZySnhIWOm8Mo8OXEt_I9jOKoHo.ZoLqUdODy
 YxzYpnyrqWnmApF1NnRrh6G4dlyJYddDFcb_t__wB8Px4D4D4UNylBHZsM7Zqhm4PRS2MgEp8dLy
 kkVeKBN8ATriMfEq_rwfXrENL6k7I6YMDNpxMhWTC3Q69DSzttMUgvbysWe4zQTH_c_h.1RGY9xC
 s7JgPCaYRlNjxMTaGucosX7j9PriM3oWhWoV0D4pKqIY3VcN7oRe23HYGxw5ntF5B.lKbmyqku1Q
 vYlDH50QXUGY_YPK8Qq232ou9z5AMg15ZXUWPhl18UWY667jy0ilyRd.Bvam1idnGIvJtDP6chZn
 U9TfHvuV1U0jwyJEbx2tBcDuckbwb_VYz4fN.bYforjRvnlZTIQRi6rlAqi7lqwGrJcIyNS0OaOi
 bhSrksxXCht1lu01zd8mS3MLxqZDOEKvKV2_Lmyi2q3HY56J0mGVGB.Lv0qC9WMGjGK_ulycWKb8
 KqcBbyWP3wSDFHe1E50KoCWQN2KWPOZ.Z.C.gZNRm8h5PUGmW6ZpAf0ZQKpxELGyO7mlriunDpcg
 y_SFendO7d_CjfN8k4wAL1sdw0xOVSU3qFZq6TG9WVyxJf3dkxFlGpwe3CF7Tgg6QhRZW0NI4ZLD
 .fOwTVvipzCHGOYfdMOuU5cnoqjkp.gAn8nUZHsmDEZNwR37Kn_CA_pSkgFPMn_aEHMZMhQUAVG2
 4RXQoW0bQbZhQ82pHwa8QicqmUoHDkYTO3VXGY2fSSCPEA55nXoUgkv3.ul4KNPcSmZ.faxiVfAU
 0FbVphglcTw.cfaj_K7IcknJvV4iUj5VRzJWn8X3McUcFXwHU372WSC70xbXw7c4CJLabBAHkeTP
 cA9dEx7D2.hCyd7hX_oEu3G0aBgzWJEcBdDsO8D8yelpMGVypP_JNPwLjYBqr.vxCnUS80OrwzSK
 v6g.KekzgKbIf2cSxg2LkPfmj9QQ1Z6d_8s.Ezvyw6lviHUahySNjcqDMqoAPfD108e5Fm4cs0_t
 CXnUGrgaxt38Ggsl4E6yfo0IaguJIlmLyCwmZll5opXeH2jMB9LCQUGKhURYvXj8dwO8I9OYuXFv
 dzweM3xSLXJKF3xIBs99pikXxb1GbTb69MLo6XYgw3Ls21lTashgbhRBvMJUJFDoA_H2YxsCMbV8
 lmuGEGlkzEHz1toft36ymk2Q8CYkQuwX5YUws89T68cBaj06MnjEopt2CCf8ifBLbMoTAJGpXkiN
 38wKzKQKZssv4D63WV.HtPdddNXMsYP9rbiAMC0VL2UQLMJ3oYMjuvd1hNLsInAX1jyAqkLmyYX3
 e23LuauxXwPlIootSgMKJFTt3F.W5lPlFB3hAnDmlrnMK8.PXRGpLgJ_yfllF3V_xdEKU23pofNZ
 bUZaS7d2ck8A2vkbXoKd3t2KhTR.QuFJ0sK5uuC4HNnAZ1C20ldch.zqmeT.swaf4QddAPmil2.l
 1uCuyqVCseEraDH1nCHSLk_NNaX4yT1aUCeUqvJ9uIsVAOUDCHZvmt0JiDai64UTpr4XqDBcB2ti
 EX3yLM5_penFTDyDG5h49sKrQZR7xQrB9boGMEogu0KCSy2uHFxo_MwKzkykhlUbb2wOsZVD08qY
 _IWxyNqNk_aCwaEuUe37InHxJy9DT2Y.ohRRqKI9YMpt.Im8M
X-Sonic-MF: <deaner92@yahoo.com>
X-Sonic-ID: 7464d60c-1205-4c0a-b555-2035bbd5ad36
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 13 Oct 2026 23:11:37 +0000
Received: by hermes--production-bf1-6d6877594b-cqkzp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f1f64af34a8ce3afe2931e33a9420692;
          Tue, 13 Oct 2026 23:11:33 +0000 (UTC)
Message-ID: <c293546a-155e-4d09-9c04-400c257137c3@yahoo.com>
Date: Tue, 13 Oct 2026 17:11:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unused function
 'to_fw_mgmt_connection'
To: Alex Elder <elder@ieee.org>, Viresh Kumar <vireshk@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261013181707.29830-1-deaner92.ref@yahoo.com>
 <20261013181707.29830-1-deaner92@yahoo.com>
 <fc8053fd-5831-48fb-98a5-f3e81323b51e@ieee.org>
Content-Language: en-US
From: Jeremy Clifton <deaner92@yahoo.com>
In-Reply-To: <fc8053fd-5831-48fb-98a5-f3e81323b51e@ieee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.26740 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo


On 10/13/26 2:12 PM, Alex Elder wrote:
> On 10/13/26 1:17 PM, Jeremy Dean Clifton wrote:
>> Remove unused function from greybus driver to_fw_mgmt_connection.
>>
>> This function is not exported or called from anywhere tree-wide.
>>
>> Confirmed with git grep and cscope.
>>
>> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
> 
> Looks good to me.  Are there other unused functions
> like this?
> 
I did not find any others like this one. There may be some in rtl. I 
think that is going away soon, though.

> Reviewed-by: Alex Elder <elder@riscstar.com>
Thank you
>> ---
>>   drivers/staging/greybus/fw-core.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/ 
>> greybus/fw-core.c
>> index 78321be80013..46b35ef55090 100644
>> --- a/drivers/staging/greybus/fw-core.c
>> +++ b/drivers/staging/greybus/fw-core.c
>> @@ -21,13 +21,6 @@ struct gb_fw_core {
>>   static struct spilib_ops *spilib_ops;
>> -struct gb_connection *to_fw_mgmt_connection(struct device *dev)
>> -{
>> -    struct gb_fw_core *fw_core = dev_get_drvdata(dev);
>> -
>> -    return fw_core->mgmt_connection;
>> -}
>> -
>>   static int gb_fw_spi_connection_init(struct gb_connection *connection)
>>   {
>>       int ret;
> 

