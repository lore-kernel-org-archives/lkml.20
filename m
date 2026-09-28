Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0873CAA31
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639253; cv=pass; b=bhFK0+E6GiG9rmnGmJWeFLUgcFECfE5QkO3YPLwLfCCWIp3IXxWdYloqC9WWn9N9IH7dr9bqfs+DEe7s8oSDpowNCjFKCWJTYU1ATfcjcLH8xGxHtF/d4fUXs2KcYxC+xX8Qz8fUE7sK88AhH3vmsEIQpSLJwKM8Aib7ysTha6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639253; c=relaxed/simple;
	bh=PKkFOvqcQ6CJt5LViyUXFqT4PMweECyFbUUz6nxIhNU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=J4d0zqQ47aPi41k9DoOowXIHibZXMOFe9k39qM3HWdpNSDLG8ZaS9GigSD0iF7CDVzYcEd5pI9mOpRonO/Kw6dhJKCLVOgshYdpX9v0fha8VJLZJ7mV7HEnbPsB0XChq01kpUIF0UnwZZx1tHjATARnXImmE47a8V3+leeHKWR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tpnu/7wc; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tpnu/7wc"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a6525e763aso25323041fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639249; cv=none;
        d=google.com; s=arc-20260327;
        b=ar6yCbw6BVPgSYUNTkVpvXsF8XfsJuvV6uT1TSay50yaWbOsoodT5G2sFLzT0UYBEJ
         Bhq8OTgm0weDbe2rKlULBeyjcXDdiu5t0jTicpSpGr1vyKNVyLPSrba0jjJthQwsaoFH
         b32w8BOfzwJITG30x6MDyx4HeTVfbRs8pxLbDWgr5HSlUc77ZMfuLzqmw5cIlTilwuA1
         hNhbzTr8mb6fALMznUFbNy5ZPYtoMyQE1H1slb1FTjQlofHmiFt6czcq8YrrQj+mF7yF
         T+3h3Cl79xsx7XU9NKEWP3tx91SoQ/WMzPtLiIDbCSudsZ1c73wQ1FG5nO9DXfohedQI
         Ia5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=kktNpcQhFnLY7FMHvhh7GhkBerBwwXBFR8Fu8KD4q2k=;
        fh=er76zvFXjCjSv4KHUxRlOntQt1yEoK/nXUQzy6fuyeY=;
        b=QElM/y5ri0dgaHgERZyIOFXdlxBLM9QrZ0tAhgP2gqGYxk+xn2vTb85fvIlig0iT3A
         5HBbyZwV4EgFokbZ9byatVZiJYLKJ0DIHMIIQG8G1Kdkxg+QDnk6mdeMD86+fphFpAlb
         xJkKEMJm1nZmbzrOs9HI3kRkF0M5FpNIFM74pCaSLyr9HcI99I6k4RhOPrn78j4Y1eEV
         A9hbftggs0vNl15jbpyayJdB5OFownptqZ47lmGQ7JUcHaj73EckIMA0cvNEqt0Wz07/
         pUpom8PeYXJjWacC4wREdupKudnApltAl2cqvup8Vzxy9ToUNyrQpn1XphDiWIUt1mh4
         OYUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639249; x=1791244049; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kktNpcQhFnLY7FMHvhh7GhkBerBwwXBFR8Fu8KD4q2k=;
        b=Tpnu/7wcffRL7zcKPFRXWxeN619eQ/h+GkvnB/KjCsn/qVlgCuIkt06zVnJO2g3d6H
         +W7w/7EAm+i1bIMCd0btVgt9CHab9p/n93dziOoy0id0CW6tevqkdk2ek4iYvtfQmInC
         drJfWk7kRC2o+LCdqf77mfsV+dtXYgnQFClhW4h4FAYaJHut8wBYYZ/4IBwLZDxb8eqF
         Jxwa91PO30XNVdDGSc+tDtZ3BCb9sRCoVbJNyvPFeEZ9uKqBKmB7XCnqkxE5WTBaaRtL
         EauMgLXIMBJEctFYAQMcTy++p2qzccw1+PAyIzFK8RcxvRO0bl41AURLw9h8oRWzcfuu
         JJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639249; x=1791244049;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kktNpcQhFnLY7FMHvhh7GhkBerBwwXBFR8Fu8KD4q2k=;
        b=0b9k5Jtq5sj1T9osJV/VdbNbjv9gF45BTjhl3wyhE+gO5gCycRJWnIudZw3hQDptOe
         jEQ3YKYBW1LVkYn7Awp2S+LPRJaDTJPYaoVheeVbL2D2QSZ6nTweijfZP8J5Lk37DLXY
         XHb7GjjyYKKRUOpxhs9m0/7Dm3DK3yh2dHzF1+OJoOPjPzveMtANcr4CBTvr42CW1pmc
         +acqsgM3YAWktBLaoh+f4md28T3R15CctnYh8vo/SygaZQ5NLqeEhTC2xq79yDFtJvAd
         eLfRN2lRpJYw3FSAegTHRKErM4otGF22B8uAlQRbZ8hpiACCio4aYKv4sA2f0BbjfEvk
         eSXg==
X-Forwarded-Encrypted: i=1; AKwUvBzsAQSyGGITDxGRrH2zOe1c71lWISpNEJIEnqjXva+AlyzG1SnzXBshA9Dp2UZi9EYGIR5AGj3fZsYJzXo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQPBUXzLE48ANKoYSUfpoohyuzVej6eLxTHe7xNxOL4IGqIjWq
	El431bbTtnwktN0oFZyBifkEDWOhoohBRdvJz0iGXkH7m673qNhutaiC4rIRbc6rfSFYm6PHqxX
	20GM+GBkvrx7344Ia3hB3JDTjTZuDQyMr+35BNKPokw==
X-Gm-Gg: AYBFou0SvDB+gDVYFhjF4PzFJFZxt3vLeEGbF6JEmeMqxLYuWE0lK6AxgoIYkG+Z63v
	MK7aSRxEA3xPibOR6PLiqtObjjiBwM5z0mJCousMK2Jg+JrPvtyjcHJLVsGQP/vO82zldAEwCDR
	YliGoCTRTACFOCm0RFtHhQ20kgWeY1gUVAd8PTK/1KbhQkDL9neuGEawr+T1X9C9q0JX6eV9SUQ
	CGrDnP9cre/NvI4fn9MxBx0U27b3KtUzmUEn6tOWR7frscrgOTET6+KHvZEdAvf4/0r1YZ7HOiY
	ZyVIBL6JBv8yzOPgTw+m2Fc67CDgHBT6KoIN6mlentp/sWLaW2CXsxhb+k9AanVcC/bHbUKgiBn
	CFl3NraDbgfP+gQOyW3KFx0YDtXO9u/VFq/YKm+ah6yfKxIKpDePfb/Jk8anRT6gKU/AP4a8=
X-Received: by 2002:a05:6512:3d1f:b0:5b8:eca8:c9bc with SMTP id
 2adb3069b0e04-5b8eca8cb2amr3494172e87.64.1790639249428; Mon, 28 Sep 2026
 16:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:16 -0400
X-Gm-Features: AclHuK-rFtYVxaOMu8tZIfEWz9N96mhXsYtoyzsMuSE0Ff6gY74Pp-6FzffbAP0
Message-ID: <CAGLNFZe6h6qAVvM0p0vHdLttOmx88j-owchgKBawopCBdw__sA@mail.gmail.com>
Subject: [PATCH] scripts: macro_checker: match complete argument identifiers
To: akpm@linux-foundation.org
Cc: sunjunchao2870@gmail.com, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000623c5d065c93b091"

--000000000000623c5d065c93b091
Content-Type: text/plain; charset="UTF-8"

The checker uses substring membership to decide whether a macro
argument is used. In '#define dummy(x) max(1, 2)', the x in 'max'
hides an unused parameter. Match the argument at identifier
boundaries so this simple false negative is reported.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--000000000000623c5d065c93b091
Content-Type: application/octet-stream; 
	name="06-macro-checker-argument-identifiers.patch"
Content-Disposition: attachment; 
	filename="06-macro-checker-argument-identifiers.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwd90c0>
X-Attachment-Id: f_mulwd90c0

RnJvbSAwMmIwMWEyMTJhMzc4NWRiMzIzNmExMWI0NDc1MWZmOWIyNmRjNDUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmlwdHM6IG1hY3JvX2NoZWNrZXI6IG1hdGNoIGNvbXBsZXRlIGFyZ3VtZW50IGlkZW50aWZpZXJz
ClRvOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogSnVsaWFu
IFN1biA8c3VuanVuY2hhbzI4NzBAZ21haWwuY29tPiwgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwoKRnJvbTogT21lciBaYWxtYW4gPG9tZXJ6YWxtYW40MkBnbWFpbC5jb20+CgpUaGUgY2hl
Y2tlciB1c2VzIHN1YnN0cmluZyBtZW1iZXJzaGlwIHRvIGRlY2lkZSB3aGV0aGVyIGEgbWFjcm8K
YXJndW1lbnQgaXMgdXNlZC4gSW4gJyNkZWZpbmUgZHVtbXkoeCkgbWF4KDEsIDIpJywgdGhlIHgg
aW4gJ21heCcKaGlkZXMgYW4gdW51c2VkIHBhcmFtZXRlci4gTWF0Y2ggdGhlIGFyZ3VtZW50IGF0
IGlkZW50aWZpZXIKYm91bmRhcmllcyBzbyB0aGlzIHNpbXBsZSBmYWxzZSBuZWdhdGl2ZSBpcyBy
ZXBvcnRlZC4KClNpZ25lZC1vZmYtYnk6IE9tZXIgWmFsbWFuIDxvbWVyemFsbWFuNDJAZ21haWwu
Y29tPgotLS0KIHNjcmlwdHMvbWFjcm9fY2hlY2tlci5weSB8IDUgKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0
cy9tYWNyb19jaGVja2VyLnB5IGIvc2NyaXB0cy9tYWNyb19jaGVja2VyLnB5CmluZGV4IGJhNTUw
OTguLmE5NzFlNGMgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvbWFjcm9fY2hlY2tlci5weQorKysgYi9z
Y3JpcHRzL21hY3JvX2NoZWNrZXIucHkKQEAgLTQ3LDEwICs0NywxMSBAQCBkZWYgY2hlY2tfbWFj
cm8obWFjcm9fbGluZSwgcmVwb3J0KToKICAgICAgICAgICAgIGlmICIuLi4iIGluIGFyZzoKICAg
ICAgICAgICAgICAgICByZXR1cm4KICAgICAgICAgZm9yIGFyZyBpbiBhcmd1bWVudHM6Ci0gICAg
ICAgICAgICBpZiBub3QgYXJnIGluIG1hY3JvX2RlZiBhbmQgcmVwb3J0ID09IEZhbHNlOgorICAg
ICAgICAgICAgdXNlZCA9IHJlLnNlYXJjaChyJ1xiJyArIHJlLmVzY2FwZShhcmcpICsgcidcYics
IG1hY3JvX2RlZikKKyAgICAgICAgICAgIGlmIG5vdCB1c2VkIGFuZCByZXBvcnQgPT0gRmFsc2U6
CiAgICAgICAgICAgICAgICAgcmV0dXJuCiAgICAgICAgICAgICAjIGlmIHRoZXJlIGlzIGEgY29y
cmVjdCBtYWNybyB3aXRoIHRoZSBzYW1lIG5hbWUsIGRvIG5vdCByZXBvcnQgaXQuCi0gICAgICAg
ICAgICBpZiBub3QgYXJnIGluIG1hY3JvX2RlZiBhbmQgaWRlbnRpZmllciBub3QgaW4gY29ycmVj
dF9tYWNyb3M6CisgICAgICAgICAgICBpZiBub3QgdXNlZCBhbmQgaWRlbnRpZmllciBub3QgaW4g
Y29ycmVjdF9tYWNyb3M6CiAgICAgICAgICAgICAgICAgcHJpbnQoZiJBcmd1bWVudCB7YXJnfSBp
cyBub3QgdXNlZCBpbiBmdW5jdGlvbi1saW5lIG1hY3JvIHtpZGVudGlmaWVyfSIpCiAgICAgICAg
ICAgICAgICAgcmV0dXJuCiAK
--000000000000623c5d065c93b091--
