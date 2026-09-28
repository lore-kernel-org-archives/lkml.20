Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB20470429
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790638985; cv=pass; b=ig7FAUwx7Wm6u4dijpW+kJRcyidiGarsnzKcvHkrxQvLx2+Qz4U5/CpurHnKnniDuJ19R6h8osX+0xZXY+YO03go77kho5tVoviTH+NoVc4jYhBHUnoK3jDTRF72ALYon78K2nlLraw815DF4tl+RmDZdTPQ2i/T/1IFS6UAOyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790638985; c=relaxed/simple;
	bh=Jeh+2Xd4AG2I2O0hzKDIItKZ7vv+hHcdVOBN2BJoRoI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qMCdqXjTShNpJ2fo/UG7y6RvkE3f8Lc1fUHf4aAMPlQ75qyJkG/Ak9U1sgwGeT71Za8nP6H4G3Y2LD11gLkJJhSuJA9uWEZGlaGW/qosEJ3palkFttoarv4C9JB5EGg9TGTxdy0Pk9cZAlqgnJ4H9T6hDQR8WlPM7vOvNTYbYjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/aaww2x; arc=pass smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/aaww2x"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-3a652a638c8so2696091fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790638982; cv=none;
        d=google.com; s=arc-20260327;
        b=iUDhkkmi9LfAbAnuEhAXgBeq7mpeHy8oJo+unMhNgew6tjmePGBuFNHFh0ZZKpHfCr
         hBNKFceio/Q1vvP+o8WAqLIzdkEmQS5wv/TaBs/FqTkWpLLFFK8iaqVjkPGo8JzHHKET
         i/yTBickbyRazUjdJGlfeDpGG+tss0G7uNdqzCy2mdcIc0YqrTAlGjcoVVWaAd0kWc4d
         YLuT5BZO2uBXCZMI6hCXxjTro5406PMDaGHNeksso0yf9LINTp7cLZZe3LkfQ0NqWXIs
         nlqjFHp9xoyr9Ux3xY5b2fbOG/e39pjnO2MXqNfAKsFTk++OZCVwuPz1O7UuZfsC8LXw
         x8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=55HPJl5SBbsItKpLLMuAZDA3mfNkU/nrSg5Ddo58dAY=;
        fh=kHuNC+wtxSgjemV5xsfPBZja7STGSP65B/ALuhSEFzo=;
        b=H2WLAdZ2p1dMBsd8JdgEtfvsoZXTvLov3WUdU/hgv8eNJo61nerkIMpDJpEVb73lgE
         wFUJz6HZojYab6NAiZDZ9u1rIi1wOr8BN70rwX8JtMuI7Tw5CwGHJSge0oxYnnQ+Th7j
         3ItyQNFLr1ScMCUOkwPrmLJTrjD8uB9/uN2wb/NBv5O6TQu+86M5v/Tx+dtbjUNq5kKN
         4HlKBFJiGJlLgCB5Gvh9J9CNj849XWt4D1Xt1ivVlC2Vnw7tmvzco9XDrGF2ZkI6HyZ9
         VMMrHA8NMd4jHmUcm0m3Wn0y2B4BdH7Ol3nKWifuP7SoqU+5B+zbRa8qPTcPu5P7hqzh
         DlZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790638982; x=1791243782; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=55HPJl5SBbsItKpLLMuAZDA3mfNkU/nrSg5Ddo58dAY=;
        b=X/aaww2xIuWwZlHP7m7rDBRIiFEJcCTLVNt5mjripvMxDicTcv9oPrIxZXXgjAZn1g
         NExbjGXVPHQGNNoe0S768MLJ3onby4gmeEeX5+gyLfmxMuTK5jwhI9pmT17qnmuHPlnW
         67RKNEpHsF20aInDO4bE4Nd9cBfjXgKZbKS5SSut2eNoqw0Sq6hIWoQlL8sZCqgIGNPb
         kFwWKMtDg1P7AoiO3TWBsPcon/1PrNDFir6sU45ScEMX+EHJeBldcmIvWKF8ol7vq3NS
         DAT2yFQyVLmMzbtWMJfocizVeQTUVAJyrDL8DdhYM4TaKJgSmCjOEFKoCjNTWqSESGWw
         qrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790638982; x=1791243782;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=55HPJl5SBbsItKpLLMuAZDA3mfNkU/nrSg5Ddo58dAY=;
        b=iK+VVvuVI8SY2y6kJhIfrqaTUN0Ew9qxl7QkhOJFsA3paoDm9VDj2ggTozYL6zs5np
         LQgSDMBLVhLBnqak93rli2xGmaXJ6QjNbws8ORd6HkUBN6QzyynnFBU67DYmsIftGPYS
         p0wk2Id7uHst8yZgFecD90TFPcGmXyQR1+++vIZnx42GNlc7ysL6RcSJIN9ReUXp43kG
         hn7bW+sk1SXvxKPi5BPOlgCBsXP6eenPk5Y+URF3/3UPmRv1cv/uudNOy1BAKAnfg6lH
         9WT54O8wjYiOcunFbxBqFlUo70+R22iJWCfSfbGRAnZN9Xk8gGsVPWGBH/JVAZEPjs9x
         xfDA==
X-Forwarded-Encrypted: i=1; AKwUvByUp5uKvCUU4bs51D8o2O54RRVV7NYY7Wf3aOHOG4vl/qh0x2NySqjhVZXmDa/Diw7biZatKYhDj+77k2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBcN/5FSK2ZxuNjkMj3iXfZgyPRBTk4SLyjNFDgTI2kK/YGxjj
	BXwpeicBUt9+nMCJo9XviufFmfiMqEkuGYvFRHbu2SO6BkNu6AvFM4M1aQWj0cJP1SbaUA7Im3K
	gRN+2h5kdbkWnngCAL74+kRwblwlgee0=
X-Gm-Gg: AYBFou2f6O21G0sDBVidtkWBr48MB2OD9IKKHzJ3Zz7bQXbp1ZVKXozXHOOe/xmaGIs
	O5oMsMaSM6yz/VgBXEVLmHd+P7NkWmEBY9d3330L5pjrwckNEsOGsk+dVEaVVFIQ4t+OOuBgkWL
	Vb90gdAgmexwYk+YlrHlK60EsHi1me+dLBeOBceuCPDfsmig0TXc5nigfa5PQxHbkGV6NGqqYZ2
	ePuP5CTsiwAwJiv+Hv6zo8da4l79uojyfbE9NFs1t12RVOJogMcXRibtG/fIPEwHNXjMetGPfO1
	6Taas4EdQdBshQo1S26gCJyMfFf+AvaFLkChr+dN1TzhbtFP8pQbakELPuRIayPA/mW25eC9vil
	9MDM66NR00QhClI/uZp2Pn7IPWkokgJ1dchNnU06F9UZzkPrypqosZFHUkNGbuvj26P5Kmt8=
X-Received: by 2002:a2e:be1e:0:b0:3a3:61ec:43c0 with SMTP id
 38308e7fff4ca-3a76478c099mr1912061fa.17.1790638981384; Mon, 28 Sep 2026
 16:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:42:49 -0400
X-Gm-Features: AclHuK-LcPc0U-LZeaKAexhC5sKfPBVUMEBBoK5mBcQvRj8Elz1BvEaJ3mu56SM
Message-ID: <CAGLNFZeWAftbDfXj3Rmb_nu206+_vSzzGoEDoQGw2=h5uc8oNA@mail.gmail.com>
Subject: [PATCH] check-uapi: preserve failure status for 256 broken headers
To: akpm@linux-foundation.org
Cc: arnd@arndb.de, quic_johmoo@quicinc.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000681e61065c93a001"

--000000000000681e61065c93a001
Content-Type: text/plain; charset="UTF-8"

check_uapi_files() returns the count of failed headers. Shell exit
statuses are limited to eight bits, so 256 failures become status
zero. The caller then exits successfully despite reporting an ABI
break. Return the documented FAIL_ABI status whenever at least one
header fails, and SUCCESS otherwise.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--000000000000681e61065c93a001
Content-Type: application/octet-stream; 
	name="01-check-uapi-failure-status.patch"
Content-Disposition: attachment; 
	filename="01-check-uapi-failure-status.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulw6ufo0>
X-Attachment-Id: f_mulw6ufo0

RnJvbSA4NTcwMTQyYzY4MTIzNTlhZGJlZDQzMWY1OTBkMGQzN2Y2NWVjNzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIGNo
ZWNrLXVhcGk6IHByZXNlcnZlIGZhaWx1cmUgc3RhdHVzIGZvciAyNTYgYnJva2VuIGhlYWRlcnMK
VG86IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPiwgSm9obiBNb29uIDxxdWljX2pvaG1vb0BxdWljaW5jLmNv
bT4sIGxpbnV4LWFwaUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKCkZyb206IE9tZXIgWmFsbWFuIDxvbWVyemFsbWFuNDJAZ21haWwuY29tPgoKY2hlY2tfdWFw
aV9maWxlcygpIHJldHVybnMgdGhlIGNvdW50IG9mIGZhaWxlZCBoZWFkZXJzLiBTaGVsbCBleGl0
CnN0YXR1c2VzIGFyZSBsaW1pdGVkIHRvIGVpZ2h0IGJpdHMsIHNvIDI1NiBmYWlsdXJlcyBiZWNv
bWUgc3RhdHVzCnplcm8uIFRoZSBjYWxsZXIgdGhlbiBleGl0cyBzdWNjZXNzZnVsbHkgZGVzcGl0
ZSByZXBvcnRpbmcgYW4gQUJJCmJyZWFrLiBSZXR1cm4gdGhlIGRvY3VtZW50ZWQgRkFJTF9BQkkg
c3RhdHVzIHdoZW5ldmVyIGF0IGxlYXN0IG9uZQpoZWFkZXIgZmFpbHMsIGFuZCBTVUNDRVNTIG90
aGVyd2lzZS4KClNpZ25lZC1vZmYtYnk6IE9tZXIgWmFsbWFuIDxvbWVyemFsbWFuNDJAZ21haWwu
Y29tPgotLS0KIHNjcmlwdHMvY2hlY2stdWFwaS5zaCB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL2No
ZWNrLXVhcGkuc2ggYi9zY3JpcHRzL2NoZWNrLXVhcGkuc2gKaW5kZXggYzhiZWVjNS4uZTM0OWQx
ZiAxMDA2NDQKLS0tIGEvc2NyaXB0cy9jaGVjay11YXBpLnNoCisrKyBiL3NjcmlwdHMvY2hlY2st
dWFwaS5zaApAQCAtMjk1LDcgKzI5NSwxMCBAQCBjaGVja191YXBpX2ZpbGVzKCkgewogCQkJIiR0
b3RhbCIgIiRBUkNIIgogCWZpCiAKLQlyZXR1cm4gIiRmYWlsZWQiCisJaWYgWyAiJGZhaWxlZCIg
LWd0IDAgXTsgdGhlbgorCQlyZXR1cm4gIiRGQUlMX0FCSSIKKwlmaQorCXJldHVybiAiJFNVQ0NF
U1MiCiB9CiAKICMgQ2hlY2sgYW4gaW5kaXZpZHVhbCBmaWxlIGZvciBVQVBJIGNvbXBhdGliaWxp
dHkK
--000000000000681e61065c93a001--
