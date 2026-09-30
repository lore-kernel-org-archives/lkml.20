Received: from bsdsz2.pd.infn.it (bsdsz2.pd.infn.it [192.84.143.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501F30DD2F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.84.143.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748097; cv=none; b=S80DSOc4tZx8fnGM1LbNZDZQZk3d2NqQDZrbDon1XQSnDUUk+Tg5/nwIcxCXLimtLp0aZC+wgtBK4MQiANEmPdLKoc1T7+PdBQEVWzExYQ6D4sNAtk422exs4WeVTbwdFd7rWAWfnTljJ6vIVt7JhWclfVy3FuX93nVAFkOirz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748097; c=relaxed/simple;
	bh=ZdHjYJ3fCIPFebgsOOyGyjfTtvdMf7EBU9oaoEc5aGM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=iEHbPQaEsIe/ZfFrEscH2tMub5kmNQGUCYhH1oevED8MyWY92j9YiwMtPbaOuSVNlxoaXOMCq0c9/R7bODJOVbPQmNQQOxdGd9Y3pNce99JH1JVV8yGUtIJ12ueD3DSdhVn6NELqfMhRyCF7E5UguwIH+kOysqw7aeYekYO9rZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pd.infn.it; spf=pass smtp.mailfrom=pd.infn.it; dkim=pass (1024-bit key) header.d=pd.infn.it header.i=@pd.infn.it header.b=h3q+/nww; arc=none smtp.client-ip=192.84.143.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pd.infn.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pd.infn.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pd.infn.it header.i=@pd.infn.it header.b="h3q+/nww"
Received: from [193.205.57.134] (wlecastellani.pd.infn.it [193.205.57.134])
	(authenticated bits=0)
	by bsdsz2.pd.infn.it (8.15.2/8.15.2) with ESMTPSA id 68U619Wl056927
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 30 Sep 2026 08:01:14 +0200 (CEST)
	(envelope-from lorenzo.castellani@pd.infn.it)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pd.infn.it;
	s=bsdsz2; t=1790748075;
	bh=dKGyeVRoaSiR7UUeFA0r2YTt+67hLuvwUhRWtjEz4bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h3q+/nwwVNUe0NTz8tbXJ7hMlbOrQvruca5tyfg25HScvAwodGMXDUdAEvyN+EQs1
	 eX0ZPGuHW0S0GpJtDF1Ixj4UpHl8wsyUQ/EyjSAFqamF5YmHyafeU+G2wZpw6tJIUv
	 K9wXmuTKxxl9GqGW53pAQgJSlaBD6qJX+UCDJHgQ=
X-Authentication-Warning: bsdsz2.pd.infn.it: Host wlecastellani.pd.infn.it [193.205.57.134] claimed to be [193.205.57.134]
Content-Type: multipart/mixed; boundary="------------CUbhokNyk7k48WkUiVSktgNi"
Message-ID: <ac2cdbd8-ce83-47ed-9783-4e5b8dd0e11f@pd.infn.it>
Date: Wed, 30 Sep 2026 08:01:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] w1: w1_therm: fix missing therm_bulk_read sysfs attribute
 with multiple bus masters
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
References: <3fe878cc-64bf-4dd1-83ed-9e9a83bfe6d4@pd.infn.it>
 <73adf4db-52f8-439f-99d4-1dab14e1bfc7@kernel.org>
Content-Language: it
From: Lorenzo Castellani <lorenzo.castellani@pd.infn.it>
In-Reply-To: <73adf4db-52f8-439f-99d4-1dab14e1bfc7@kernel.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (bsdsz2.pd.infn.it [192.84.143.16]); Wed, 30 Sep 2026 08:01:14 +0200 (CEST)
X-Spam-Score: -1.098 () BAYES_00,HELO_MISC_IP,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.83 on 192.84.143.16

This is a multi-part message in MIME format.
--------------CUbhokNyk7k48WkUiVSktgNi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The patch is attached.

Lorenzo


Il 30/09/2026 07:23, Krzysztof Kozlowski ha scritto:
> On 27/09/2026 12:43, lorenzo.castellani wrote:
>>   From 32e145b49cf41ce150a97ce52c63f5aae1bbbea7 Mon Sep 17 00:00:00 2001
>> From: Lorenzo Castellani <lorenzo.castellani@pd.infn.it>
>> Date: Tue, 22 Sep 2026 11:12:30 +0200
>> Subject: [PATCH] w1: w1_therm: fix missing therm_bulk_read sysfs attribute
>>    with multiple bus masters
> Your mailing is corrupted.
>
>> +static int w1_therm_count_bulk_read_slaves(struct w1_master *dev_master,
>> +    struct w1_slave *exclude_sl)
>> +{
>> +    struct w1_slave *sl;
>> +    int count = 0;
>> +
>> +    list_for_each_entry(sl, &dev_master->slist, w1_slave_entry) {
>> +        if (sl != exclude_sl && sl->family_data && bulk_read_support(sl))
>> +            count++;
>> +    }
>> +    return count;
>> +}
> And here.
>
> Best regards,
> Krzysztof

-- 
--------------------------------------
Lorenzo Castellani
Istituto Nazionale di Fisica Nucleare
Sezione di Padova
Via Marzolo 8
35131 PADOVA
Italy
E-mail: lorenzo.castellani@pd.infn.it
Phone:  +39 049 9677227
--------------------------------------

--------------CUbhokNyk7k48WkUiVSktgNi
Content-Type: text/plain; charset=UTF-8;
 name="0001-w1-w1_therm-fix-missing-therm_bulk_read-sysfs-attrib.patch"
Content-Disposition: attachment;
 filename*0="0001-w1-w1_therm-fix-missing-therm_bulk_read-sysfs-attrib.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzMmUxNDViNDljZjQxY2UxNTBhOTdjZTUyYzYzZjVhYWUxYmJiZWE3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBMb3JlbnpvIENhc3RlbGxhbmkgPGxvcmVuem8uY2Fz
dGVsbGFuaUBwZC5pbmZuLml0PgpEYXRlOiBUdWUsIDIyIFNlcCAyMDI2IDExOjEyOjMwICsw
MjAwClN1YmplY3Q6IFtQQVRDSF0gdzE6IHcxX3RoZXJtOiBmaXggbWlzc2luZyB0aGVybV9i
dWxrX3JlYWQgc3lzZnMgYXR0cmlidXRlCiB3aXRoIG11bHRpcGxlIGJ1cyBtYXN0ZXJzCgpX
aGVuIG11bHRpcGxlIDEtV2lyZSBidXMgbWFzdGVycyBhcmUgcHJlc2VudCBpbiB0aGUKc3lz
dGVtLCB0aGUgZ2xvYmFsIG1vZHVsZS1sZXZlbCBjb3VudGVyIGNhdXNlcyB0aGUKdGhlcm1f
YnVsa19yZWFkIHN5c2ZzIGF0dHJpYnV0ZSB0byBiZSBjcmVhdGVkIG9ubHkKZm9yIHRoZSBm
aXJzdCBtYXN0ZXIgd2hlcmUgYSBidWxrLXJlYWQgY2FwYWJsZSBzbGF2ZQppcyBkaXNjb3Zl
cmVkLiBTdWJzZXF1ZW50IGJ1cyBtYXN0ZXJzIGZhaWwgdG8gZXhwb3NlCnRoZSBhdHRyaWJ1
dGUgYmVjYXVzZSB0aGUgY291bnRlciBpcyBhbHJlYWR5IG5vbi16ZXJvLgoKRml4IHRoaXMg
YnkgcmVwbGFjaW5nIHRoZSBnbG9iYWwgc3RhdGljIGNvdW50ZXIgd2l0aAphIHBlci1tYXN0
ZXIgaGVscGVyIGZ1bmN0aW9uIHRoYXQgaXRlcmF0ZXMgb3ZlciB0aGUKc2xhdmVzIGFzc29j
aWF0ZWQgc3BlY2lmaWNhbGx5IHdpdGggdGhlIGdpdmVuIG1hc3RlcgooZGV2X21hc3Rlci0+
c2xpc3QpLiBUaGlzIGVuc3VyZXMgdGhhdCBlYWNoIGJ1cwptYXN0ZXIgaW5kZXBlbmRlbnRs
eSBjb3JyZWN0bHkgdHJhY2tzIGFuZCBleHBvc2VzIHRoZQp0aGVybV9idWxrX3JlYWQgc3lz
ZnMgYXR0cmlidXRlIHdoZW4gYnVsay1yZWFkCmNhcGFibGUgZGV2aWNlcyBhcmUgcHJlc2Vu
dC4KClNpZ25lZC1vZmYtYnk6IExvcmVuem8gQ2FzdGVsbGFuaSA8bG9yZW56by5jYXN0ZWxs
YW5pQHBkLmluZm4uaXQ+Ci0tLQogbGludXgtcnBpLTYuMTgueS9kcml2ZXJzL3cxL3NsYXZl
cy93MV90aGVybS5jIHwgMzAgKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpbnV4
LXJwaS02LjE4LnkvZHJpdmVycy93MS9zbGF2ZXMvdzFfdGhlcm0uYyBiL2xpbnV4LXJwaS02
LjE4LnkvZHJpdmVycy93MS9zbGF2ZXMvdzFfdGhlcm0uYwppbmRleCA4MzJlM2RhOTQuLjRj
OGU2N2VjOCAxMDA2NDQKLS0tIGEvbGludXgtcnBpLTYuMTgueS9kcml2ZXJzL3cxL3NsYXZl
cy93MV90aGVybS5jCisrKyBiL2xpbnV4LXJwaS02LjE4LnkvZHJpdmVycy93MS9zbGF2ZXMv
dzFfdGhlcm0uYwpAQCAtNDQsOSArNDQsNiBAQAogc3RhdGljIGludCB3MV9zdHJvbmdfcHVs
bHVwID0gMTsKIG1vZHVsZV9wYXJhbV9uYW1lZChzdHJvbmdfcHVsbHVwLCB3MV9zdHJvbmdf
cHVsbHVwLCBpbnQsIDApOwogCi0vKiBDb3VudGVyIGZvciBkZXZpY2VzIHN1cHBvcnRpbmcg
YnVsayByZWFkaW5nICovCi1zdGF0aWMgdTE2IGJ1bGtfcmVhZF9kZXZpY2VfY291bnRlcjsg
LyogPTAgYXMgcGVyIEMgc3RhbmRhcmQgKi8KLQogLyogVGhpcyBjb21tYW5kIHNob3VsZCBi
ZSBpbiBwdWJsaWMgaGVhZGVyIHcxLmggYnV0IGlzIG5vdCAqLwogI2RlZmluZSBXMV9SRUNB
TExfRUVQUk9NCTB4QjgKIApAQCAtOTY4LDYgKzk2NSwxOSBAQCBzdGF0aWMgaW5saW5lIHM4
IGludF90b19zaG9ydChpbnQgaSkKIAogLyogSW50ZXJmYWNlIEZ1bmN0aW9ucyAqLwogCitz
dGF0aWMgaW50IHcxX3RoZXJtX2NvdW50X2J1bGtfcmVhZF9zbGF2ZXMoc3RydWN0IHcxX21h
c3RlciAqZGV2X21hc3RlciwKKwlzdHJ1Y3QgdzFfc2xhdmUgKmV4Y2x1ZGVfc2wpCit7CisJ
c3RydWN0IHcxX3NsYXZlICpzbDsKKwlpbnQgY291bnQgPSAwOworCisJbGlzdF9mb3JfZWFj
aF9lbnRyeShzbCwgJmRldl9tYXN0ZXItPnNsaXN0LCB3MV9zbGF2ZV9lbnRyeSkgeworCQlp
ZiAoc2wgIT0gZXhjbHVkZV9zbCAmJiBzbC0+ZmFtaWx5X2RhdGEgJiYgYnVsa19yZWFkX3N1
cHBvcnQoc2wpKQorCQkJY291bnQrKzsKKwl9CisJcmV0dXJuIGNvdW50OworfQorCiBzdGF0
aWMgaW50IHcxX3RoZXJtX2FkZF9zbGF2ZShzdHJ1Y3QgdzFfc2xhdmUgKnNsKQogewogCXN0
cnVjdCB3MV90aGVybV9mYW1pbHlfY29udmVydGVyICpzbF9mYW1pbHlfY29udjsKQEAgLTk5
Miw5ICsxMDAyLDExIEBAIHN0YXRpYyBpbnQgdzFfdGhlcm1fYWRkX3NsYXZlKHN0cnVjdCB3
MV9zbGF2ZSAqc2wpCiAJaWYgKGJ1bGtfcmVhZF9zdXBwb3J0KHNsKSkgewogCQkvKgogCQkg
KiBhZGQgdGhlIHN5cyBlbnRyeSB0byB0cmlnZ2VyIGJ1bGtfcmVhZAotCQkgKiBhdCBtYXN0
ZXIgbGV2ZWwgb25seSB0aGUgMXN0IHRpbWUKKwkJICogYXQgbWFzdGVyIGxldmVsIG9ubHkg
dGhlIDFzdCB0aW1lIG9uIHRoaXMgbWFzdGVyCiAJCSAqLwotCQlpZiAoIWJ1bGtfcmVhZF9k
ZXZpY2VfY291bnRlcikgeworCQlpbnQgYnVsa19jb3VudCA9IHcxX3RoZXJtX2NvdW50X2J1
bGtfcmVhZF9zbGF2ZXMoc2wtPm1hc3Rlciwgc2wpOworCisJCWlmICghYnVsa19jb3VudCkg
ewogCQkJaW50IGVyciA9IGRldmljZV9jcmVhdGVfZmlsZSgmc2wtPm1hc3Rlci0+ZGV2LAog
CQkJCSZkZXZfYXR0cl90aGVybV9idWxrX3JlYWQpOwogCkBAIC0xMDAzLDggKzEwMTUsNiBA
QCBzdGF0aWMgaW50IHcxX3RoZXJtX2FkZF9zbGF2ZShzdHJ1Y3QgdzFfc2xhdmUgKnNsKQog
CQkJCSIlczogRGV2aWNlIGhhcyBiZWVuIGFkZGVkLCBidXQgYnVsayByZWFkIGlzIHVuYXZh
aWxhYmxlLiBlcnI9JWRcbiIsCiAJCQkJX19mdW5jX18sIGVycik7CiAJCX0KLQkJLyogSW5j
cmVtZW50IHRoZSBjb3VudGVyICovCi0JCWJ1bGtfcmVhZF9kZXZpY2VfY291bnRlcisrOwog
CX0KIAogCS8qIEdldHRpbmcgdGhlIHBvd2VyIG1vZGUgb2YgdGhlIGRldmljZSB7ZXh0ZXJu
YWwsIHBhcmFzaXRlfSAqLwpAQCAtMTA0MCw5ICsxMDUwLDkgQEAgc3RhdGljIHZvaWQgdzFf
dGhlcm1fcmVtb3ZlX3NsYXZlKHN0cnVjdCB3MV9zbGF2ZSAqc2wpCiAJaW50IHJlZmNudCA9
IGF0b21pY19zdWJfcmV0dXJuKDEsIFRIRVJNX1JFRkNOVChzbC0+ZmFtaWx5X2RhdGEpKTsK
IAogCWlmIChidWxrX3JlYWRfc3VwcG9ydChzbCkpIHsKLQkJYnVsa19yZWFkX2RldmljZV9j
b3VudGVyLS07Ci0JCS8qIERlbGV0ZSB0aGUgZW50cnkgaWYgbm8gbW9yZSBkZXZpY2Ugc3Vw
cG9ydCB0aGUgZmVhdHVyZSAqLwotCQlpZiAoIWJ1bGtfcmVhZF9kZXZpY2VfY291bnRlcikK
KwkJaW50IGJ1bGtfY291bnQgPSB3MV90aGVybV9jb3VudF9idWxrX3JlYWRfc2xhdmVzKHNs
LT5tYXN0ZXIsIHNsKTsKKwkJLyogRGVsZXRlIHRoZSBlbnRyeSBpZiBubyBtb3JlIGRldmlj
ZSBzdXBwb3J0IHRoZSBmZWF0dXJlIG9uIHRoaXMgbWFzdGVyICovCisJCWlmICghYnVsa19j
b3VudCkKIAkJCWRldmljZV9yZW1vdmVfZmlsZSgmc2wtPm1hc3Rlci0+ZGV2LAogCQkJCSZk
ZXZfYXR0cl90aGVybV9idWxrX3JlYWQpOwogCX0KLS0gCjIuNDMuMAoK

--------------CUbhokNyk7k48WkUiVSktgNi--
