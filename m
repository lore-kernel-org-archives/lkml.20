Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCAC377AB2
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788614997; cv=pass; b=c0qgqBQ1f/7Ia7o3TpctZKEL8TEYzCZ4WADBRUD96inDux1arnb8hXOMLAvI7awlgobEiyLK14vmwS1FGcY1y2dc8BOau/ptfOkI9BSzy2emAHe7Y+pbHUYtfU7skhu5stJgV9JwUc7izTMr9/XsUpJXDeJ72hl+1sAWn8cbDc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788614997; c=relaxed/simple;
	bh=/qgxJ5U1XejGBgezHLiZSaJYn4KHKLTpzDVEiNZyO/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h69GaScQEBfZFBvaeLyzMjY9d58u3grsZ20rMcJRxTadoYOMbNGmNmqzESPaFYLDOykUwcB/uvHsgqydd2Cs8BJ7Sus0WivGQiZOzgjnNRvWX+6ZXink3dDyPYcS6p+dXLEQbOy66C9k36CHn2IjzbjuIlDCWRzBlWR6PK2uvds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9ua6VT7; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9ua6VT7"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b92a58cb7eso78447eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 06:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788614987; cv=none;
        d=google.com; s=arc-20260327;
        b=W3dvanenI8nHfYPOaggxw4RqnDqVkZwoO7JNsmknHL/sejSt/eAUp9l3UF5oOg4YoG
         40NMNGDMElecoPh2xKTqhURUvChCIU8ObyOOSlS51hCAvzgyW5z/laz2ihDMLUOnaLX7
         QlTXG6P8Vxtp20wQeu+acSWNRQ3TxqpkxQVmS5R1Q0LByIW/j3US0TgAtpzXAJDLtg6M
         Qlu5TyQ6+X6cYVRryn0WJggNNy3ghuYFLiAcB5biPEFESGgIrZN7LeVh0EVkm8R2WMeE
         /DpJOgi5RfcmfzkIb/+t9IjnqanLzG4mAdQcgUVZADtp8MaAoNZxwrMrdZyqpxWicDNt
         OBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=byHzJnHdE3Q5NcViqCmqSPyzgollLD9/A1kajaUXPp8=;
        fh=FUAcBWaSqw/Q4gbLQmSsrdjfixKitnKj/xzRhi8F0Gw=;
        b=p6QJGip16aiNMz5NRDBRfvByirrOM/OXBFdYwTd1ocOXVPqFN8Z4Ndo6hv3BUaLDWg
         kE0BO5izjiiVomwAd2xfACas4jrq2SrEupMTrDcnvAHLT8KFMK/4hur8PrgEYGbo2WK1
         aoGr6SFjZaKjb+xJILWdFVyGECns5N/H/fW+DFYRk9ufd+9NwP375uCJ+cRBTIGRwgib
         tgBtoZ7JPDiLormRKdE6/lYaBeBwguB9n1rDQFgaO2Bt7wj1biFGFfkTKBJEVfO+ud0X
         w8U+/lxT9Mrroh2QCJrY+femHsCL5HF7ENVREuJMcg/A4+7zlxO9GayMPM8sOXXKNvMQ
         CtCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788614987; x=1789219787; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byHzJnHdE3Q5NcViqCmqSPyzgollLD9/A1kajaUXPp8=;
        b=C9ua6VT7OeGDYijrihI8mmFOQX0vyzLOGeZID1wu04Z0VcDVdJ6N7OX025BZdvXBGZ
         srIKUhxDumOUu2pGD4jfs90Gfc5IM0dRaXB4hNin+mFZnrs0G5VYBrVLnu5IjPqylHjU
         oh7XhMfjc7ALR0Rgs6FC3fgAfd4pEH3cnVo/VG7xqRPr3HHn3bCLbV98L+hjdgi9bB35
         yN2L+/TPRHpsrTRmGw5ho2dqJ2zoHIraL3894Vc15rnGfGh50fxgVR7aUk1fWfEa0aR/
         iebhE9+IUsJkBrVoO1RZFrOCOpU6eaJor1W14KrThADgHSzJe0G73O8BXw7UNFTP88ss
         JTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614987; x=1789219787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=byHzJnHdE3Q5NcViqCmqSPyzgollLD9/A1kajaUXPp8=;
        b=W02vwkE3BAI+0ZUuB87LbXVDKudUMQEO56pP9BmX7zYaGik55ZWmM6yvVyz0cf/6va
         VzEloVFHEvKXQT385MqC7HlnHFJLewApt46I118Lekbt+KJHH1cFrF421omxgeS0qO/P
         6oiluC+FXdQ1rCuPkffvvD8lcDF2C7HVtnM18sJ9gOqB2xoHhWR38llS55HraUjlq0kp
         E5La9p3tjL00WoM0Hqf6xHwuQeVhl+mxsMUraHEXl7ZzVL2e+Yxf2YKIJMgfFw8kHmO1
         E7QWm7h69wB7BQWwohPfr71FyTlwX4Sx0kpj8F4fVYMeorkNNzSh6P9NUvl0Aa3mAaVb
         tNHA==
X-Forwarded-Encrypted: i=1; AKwUvBwZzZz50c3eHgAJD09brY0xefhOWHBYrC3z93EmhpCIFoyjQ9E3mEouG5Ca2mI48hhR5vPm2tbDSc5sfF0=@vger.kernel.org
X-Gm-Message-State: AFuF++mgXlz6DblQyC9fV1SoqTLYLBRkwJuSdFAxfQ5BsQTp0+hEwbTv
	ugtNRzSjc6DZ9qwvY5HBHTZGEPsSuZaFbIKd8g/fzF/MA4eC6N6hK/JqFp1nw+vbI4Pdz6I9rqj
	pwD2jr+Rfj+TTTW/hmsVGajHYQqrZafs=
X-Gm-Gg: AYBFou1aJFeXF2uSMU/dkV8Kve0T5pl4Ncp56tWuwXFH+0EfK4bXx0sKijClng3OVIZ
	cO7ENVxQtk1t0inwz8mrGorjJ+C/yJrsIvgyC2/4ciZk1+4rJy40AqJ2UheSmFxYUt8fjbx48kv
	ibSEXXYZYj+aXt33ByQ2unYuN4KTsZQN7pEntJLCD+qpDnVGxZ4X9OwW4NlVYTxhctPSxflXIIX
	T0y3cRr40cSZCg3Ivfp637Emf+Q6kjktAJYEEeZ7RhMDVnkAZS+Z2T0t9EJ1wMjH1VmVlIB5vQK
	znp3JNWdLveUVKzV1Pys5fXDplKnSbnegankCGXA0oxtEVBzYRkWxEo=
X-Received: by 2002:a05:6820:c2ce:20b0:6b9:4557:2722 with SMTP id
 006d021491bc7-6b945572d29mr452883eaf.3.1788614987087; Sat, 05 Sep 2026
 06:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMnqnYxPHeXo6CsuKRGH=oixAsAa0z1_++266yzKW7qR6cqykw@mail.gmail.com>
 <apqWn2EoguCwX5po@wyuan.org>
In-Reply-To: <apqWn2EoguCwX5po@wyuan.org>
From: Jiaming Ouyang <jiamingouyang13@gmail.com>
Date: Sat, 5 Sep 2026 15:29:36 +0200
X-Gm-Features: AcwNN1XynqJWLvedk2B5geFbTmyxOx8KybE4He9IXxPP6qvqQ7Itf5Mp39uTORU
Message-ID: <CAMnqnYwSKeTHi41iesHxJo1b_GGKWkFzfavJHWtEqxD0St3oBg@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add usb/ohci translation
To: Weijie Yuan <wy@wyuan.org>
Cc: linux-doc@vger.kernel.org, "corbet@lwn.net" <corbet@lwn.net>, alexs@kernel.org, 
	si.yanteng@linux.dev, dzm91@hust.edu.cn, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f298db065abc6060"

--000000000000f298db065abc6060
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I think this .patch in attachment will solve this problem, and the
commit information has been modified according to your feedback.

Thanks.

On Fri, Sep 4, 2026 at 12:00=E2=80=AFPM Weijie Yuan <wy@wyuan.org> wrote:
>
> Hi,
>
> On Sat, Aug 29, 2026 at 08:48:07PM +0200, Jiaming Ouyang wrote:
> > From 395948212144549e20cfcdbd053817c4e068da35 Mon Sep 17 00:00:00 2001
> > From: Jiaming Ouyang <jiamingouyang13@gmail.com>
> > Date: Sat, 29 Aug 2026 20:35:37 +0200
> > Subject: [PATCH] docs/zh_CN: add usb/ohci translation
> >
> > Signed-off-by: Jiaming Ouyang <jiamingouyang13@gmail.com>
>
> 'git am' complains:
>
> error: git diff header lacks filename information when removing 1
> leading pathname component.
>
> So I guess probably you don't need to include these email headers in the
> changelog/commit message?  I'm not sure, but you can take a look at
> relevant docs for this.
>
> Also, instead, please write some meaningful info in the commit message,
> see:
>
>   https://docs.kernel.org/translations/zh_CN/how-to.html#id13
>
> Thanks.

--000000000000f298db065abc6060
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-docs-zh_CN-add-Chinese-translation-for-usb-ohci.rst_v2.patch"
Content-Disposition: attachment; 
	filename="0001-docs-zh_CN-add-Chinese-translation-for-usb-ohci.rst_v2.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtof30jg0>
X-Attachment-Id: f_mtof30jg0

RnJvbSAyNjMxNmVlY2ViM2RiZTQyYmQ1OWNlZDk5YjhkYWMwMmZiODU2MTM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEzQGdtYWls
LmNvbT4KRGF0ZTogU2F0LCAyOSBBdWcgMjAyNiAyMDozNTozNyArMDIwMApTdWJqZWN0OiBbUEFU
Q0hdIGRvY3MvemhfQ046IGFkZCBDaGluZXNlIHRyYW5zbGF0aW9uIGZvciB1c2Ivb2hjaS5yc3QK
ClRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL3VzYi9vaGNpLnJzdCBpbnRvIENoaW5lc2UgU2ltcGxp
ZmllZC4KClRoZSB0cmFuc2xhdGlvbiBjb3ZlcnMgT0hDSSBkcml2ZXIgb3ZlcnZpZXcsIGhhcmR3
YXJlIHByb3RvY29sCmRpZmZlcmVuY2VzIChPSENJIHZzIFVIQ0kpLCBpbXByb3ZlbWVudHMgc2lu
Y2UgMi40IGtlcm5lbCwKcXVldWVhYmxlIGludGVycnVwdCB0cmFuc2ZlcnMsIGFuZCBub24tUENJ
IHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBKaWFtaW5nIE91eWFuZyA8amlhbWluZ291eWFuZzEz
QGdtYWlsLmNvbT4KLS0tCiAuLi4vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QgICAg
ICAgICAgfCAgMiArLQogRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2ku
cnN0IHwgMzcgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2kucnN0CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL3VzYi9pbmRleC5yc3QKaW5kZXggZGY5OTgxNGM2NDk3Li5jOTZlYWNmMTNl
MTEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3VzYi9pbmRl
eC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL2luZGV4LnJz
dApAQCAtMzIsNiArMzIsNyBAQCBVU0Ig5pSv5oyBCiAgICAgY2hpcGlkZWEKICAgICBkd2MzCiAg
ICAgZWhjaQorICAgIG9oY2kKICAgICB1c2Jtb24KIAog5b6F57+76K+R5paH5qGj77yaCkBAIC00
OSw3ICs1MCw2IEBAIFVTQiDmlK/mjIEKICogbWFzcy1zdG9yYWdlCiAqIG1pc2NfdXNic2V2c2Vn
CiAqIG10b3VjaHVzYgotKiBvaGNpCiAqIHJhdy1nYWRnZXQKICogdXNiaXBfcHJvdG9jb2wKICog
dXNiLXNlcmlhbApkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dXNiL29oY2kucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNiL29oY2ku
cnN0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNDM4N2JiMjc0MDcx
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdXNi
L29oY2kucnN0CkBAIC0wLDAgKzEsMzcgQEAKKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wCisKKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi91c2Ivb2hjaS5yc3QKKworOue/u+iv
kTog5qyn6Ziz5a626ZOtIEppYW1pbmcgT3V5YW5nIDxqaWFtaW5nb3V5YW5nMTNAZ21haWwuY29t
PgorCis9PT09PT09PQorT0hDSempseWKqAorPT09PT09PT0KKworMjAyNuW5tDjmnIgyOeaXpQor
CivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+aYr+S4gOS4qlVTQuS4u+acuuaOp+WItuWZqOmp
seWKqOeoi+W6j++8iEhDRO+8ie+8jOWug+a6kOiHqjIuNOWGheaguOezu+WIl+S4reeahOKAnHVz
Yi1vaGNp4oCdCivpqbHliqjnqIvluo/jgILigJx1c2Itb2hjaeKAneS7o+eggeS4u+imgeeUsSBS
b21hbiBXZWlzc2dhZXJiZXIgPHdlaXNzZ0B2aWVubmEuYXQ+IOe8luWGme+8jOS9huS5n+iOt+W+
l+S6hgor6K645aSa5YW25LuW5Lq655qE6LSh54yu77yI6K+36ZiF6K+75YW254mI5p2D77yJCivj
gIIKKwor5a6D5pSv5oyB4oCc5byA5pS+5Li75py65o6n5Yi25Zmo5o6l5Y+j4oCd77yIT0hDSe+8
ie+8jOivpeaOpeWPo+agh+WHhuWMluS6hueUqOS6juS4jlVTQiAxLjHkuLvmnLrmjqfliLblmajp
gJrkv6HnmoTnoazku7blr4QKK+WtmOWZqOWNj+iuruOAguS4juiLseeJueWwlOaXqeacn+eahOKA
nOmAmueUqOS4u+acuuaOp+WItuWZqOaOpeWPo+KAne+8iFVIQ0nvvInnm7jmr5TvvIzlroPlsIbm
m7TlpJrlj6rog73lip/og73ms6jlhaXliLDnoazku7YKK+S4reOAgumZpOiLseeJueWwlOWSjOWo
geebm+S5i+WklueahOWFtuS7luS+m+W6lOWVhueahFVTQjEuMeaOp+WItuWZqOmAmuW4uOS9v+eU
qE9IQ0njgIIKKwor6IeqMi405YaF5qC45Lul5p2l55qE5pu05pS55YyF5ousCisKKwktIOaPkOmr
mOS6huWBpeWjruaApzsg5L+u5aSN5LqG6ZSZ6K+vOyDlh4/lsJHkuoblvIDplIAKKwktIOaUr+aM
geabtOaWsOWSjOeugOWMlueahHVzYmNvcmUgQVBJCisJLSDkuK3mlq3kvKDovpPlj6/ku6Xmm7Tl
pKfvvIzlubbkuJTlj6/ku6XmjpLpmJ8KKwktIOmAmui/h+S9v+eUqOS4iuWxguKAnGhjZOKAneah
huaetu+8jOWHj+WwkeS7o+eggemHjworCS0g5pSv5oyB5LiA5Lqb6Z2eUENJ55qET0hDSeWunueO
sAorCS0gLi4uIOS7peWPiuabtOWkmgorCivigJxPSENJLWhjZOKAnempseWKqOeoi+W6j+WkhOeQ
huaJgOaciVVTQiAxLjHkvKDovpPnsbvlnovjgILmiYDmnInnsbvlnovnmoTkvKDovpPpg73lj6/k
u6XmjpLpmJ/jgILlnKjigJx1c2Itb2hjaeKAneS4reS5nwor5piv5aaC5q2k77yM5L2G5Lit5pat
5Lyg6L6T6Zmk5aSW44CC5Lul5YmN77yM5L2/55So5LiA5bin55qE5ZGo5pyf5Lya5Zug5Li6SVJR
5aSE55CG55qE5byA6ZSA6ICM5a+86Ie05pWw5o2u5Lii5aSx55qE6aOO6Zmp44CCCivlvZPkuK3m
lq3kvKDovpPmjpLpmJ/ml7bvvIzlj6/ku6XpgJrov4fnoa7kv53noazku7blnKjmk43kvZzns7vn
u5/lpITnkIbnm7jlhbNJUlHml7blp4vnu4jmnInkvKDovpPpnIDopoHlpITnkIbvvIzmnaXmnIDl
pKfpmZAKK+W6pueahOmZjeS9jui/meS6m+mjjumZqQorCistIOasp+mYs+WutumTrSBKaWFtaW5n
IE91eWFuZworICA8amlhbWluZ291eWFuZzEzQGdtYWlsLmNvbT4KLS0gCjIuNTMuMAoK
--000000000000f298db065abc6060--
