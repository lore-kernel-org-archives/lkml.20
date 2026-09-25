Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEF649DBBE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341342; cv=pass; b=l8mF4KQS5iVFRFx8F4iX+Z9QB9MsLcmI2F774i9ec+E3446OFT+lZhQnINbA5MZljPOmsyFwcZvutYBJHlManRyjBI3+zJ0Y9btffmhzd04HI1dCq6O8imH+GNwzS31m/ySm4hFEp0sKCZrj3EVOIi9ECewtz2HxUOLSc5p9vr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341342; c=relaxed/simple;
	bh=lW/t0ljBqFMlE+2JM9CDRp5S00XDRA6MppSwwR8dKC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZlpEVIyKVoFgTRSmtG1LKdF3xtZNCUMR/62wqfxgQ5M4yBUAhwIhbOfn0kW1GRoludunkqaKtaAa7gFjdZiSuHUhbWtH5cwJ41TKpYyKALHa+hHzVlL6hc+uahWoAPNshU/0ys+SojKZ/VcMLDkF0445Sy5z8L0QkZTtrc1+uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrJieSNa; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrJieSNa"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c206dc8b0dso719669b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790341340; cv=none;
        d=google.com; s=arc-20260327;
        b=DUYZ0DNikyxL61zooF9If/ynJh3BcZTlUSJpBncEmAJ0HrSf230lYO69TyKtIol9Wi
         dc69Opw9w2n4K2O9KE00LjWF+/1bHRzpWTlx511VN3o0vkvyx1X5cyDLEFDHvmLqVQja
         Jp+L4JKqOFq/BqS15AnU+4jqbrM0DnE5futQMhTJaLvhW2JD1zvJqhSpItNo0q8/eqA1
         V4BRayyj2fn0VTf6nErCDZ8gXwTtqs176wM+S/OqHrdPB08PVVLvWdzJ+DpsbW51Bm9/
         DF70S5jxfZjdhHHZBxUenuI5gyIh4TRLK0ebPTj66xPAXfKU69rUr0Idu5htFIpKL8Rp
         8mTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=66DuN/r1j06HGfAgzFt/xw2W868bH/m+NSU/xQtEkJk=;
        fh=HSyX4s35T4GA6bFw/Hxt4NPxmVbeYtr2kw4YLWn5TKg=;
        b=HP8Wb+N+3l1NZyfBqVEXskRl1mcGJxR4LTNzaPNwpDWsV68/lXQhUnNoeKU5araQTO
         ftkg8oISpdevhqftxLYpe94gzzDd4eWX4jXq4der5s6NEtnJVR/FSsksP9lGK5735+fC
         j9nQ9PRdQhJVmZ6ASYy5JOiuQwxQvsHkWX1sQW1P6yrlT/iXVq3OJaMYQfUZXbeSoPKi
         b+Z0qzx3Jk6RDzH/HbD0bGvLYE6WahTwlPq7RUfpy5BjwHAIFRyKzZqP5rzMcxurxjBK
         dBA+6JBpwa3oeL7Rv4dPg43wNcMmAwA2iNogXjiQf55JkR0Mwa0uMFTtgpuXa8ZQARmo
         vYaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790341340; x=1790946140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66DuN/r1j06HGfAgzFt/xw2W868bH/m+NSU/xQtEkJk=;
        b=IrJieSNaiXLIBo+8TwoMfBMARxFFC11HI3dr5jEeUNrzImsXG+6lJEBPUW610fzdwv
         yt4Qo4MmEv0AMF8Xavw52acMQlmhMFDyzUzC3TP69nVybivr61WgBxwhjTUaPDIleJK2
         UAjcyzXd7Nyq8ZHpfqOwIZjhhkM4QgLtcv0FMPtmcdbGKlnApIdIwSeXgtirsLOXdlHm
         wRkZE4blZqYsUnOPqexn185cIwa9FOBLJNjTd/3FBqkYwNQjYZBM8eH/i5ITK+C1S2fn
         7yhr1OFvqUR1IhmNyzDdCuBT5BTFfDhUU2qcKwsL23mcSc/UMZlIkuUA7pD+UvX0f+V2
         qQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341340; x=1790946140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66DuN/r1j06HGfAgzFt/xw2W868bH/m+NSU/xQtEkJk=;
        b=t5zq+p7PvO1/6kCdycKvBnfdwSgUSBfZ0S3eJDH18AY4MJLwqsiipKOLS5WE8c6jgF
         YduJUArY4KnfVKaFaJAlaaH11Q6fJzUKZ/KKfCdQsbopeItm5qJUixRHV4f0NDwRAl0q
         pFEX9CDMLV24B3F6iJeCBj0KyeaeoLJXJQ4G101Jsafmkag/WdEKDo/ZOqQoJ9jZi9mh
         4Rs6zCkqRhOj1S46VkuMHWghFeAUnWvfIctxGQI8gJQpivFcOE1/yUsJh7d+0a5386vy
         TGY7a94o+O24Zk+R2jr6VdGZqB52Ix8ZGs5xf9uwffkGgE1lGnSxKct8y6WSD0MbOPsa
         Ik0g==
X-Forwarded-Encrypted: i=1; AKwUvBzbdMtpnQQnMrSTVmIRqjcKp9bnEiW72LB+YH4w9Lk3ONZwKOCQ0c4BmDSqrjgI6flL/hUwZb2PKUQiNVs=@vger.kernel.org
X-Gm-Message-State: AFuF++kLUArvz9oEn7ZXy2qP5L0ptyw/aIvHKoQqBDOjhtjTwD2O5FR9
	Q1kjcL+mMuZKmUXy1vkgjfFSlKM8EjLJ2sI91pIo8WP93G9TBrHab+6C/5da9AIQGe7VeTXzuYm
	mbWFS7xUVGTH8hT+ebSuCgE3h4NtW/xI=
X-Gm-Gg: AYBFou1LtI379ggaxLSErbz7onNWS3FwLmvfavxs1HayvwDaVvywPHGV4cfUlsp2umv
	xY/2fF5s3t3aNTOkeSdmxn1UUwudWHP+AEI32QduSYYCokmCfnMNxLTsrYJJEfArGvAsM1EDMe6
	QGxSFUdUi2YQZQmH5NPsBO4Ut/Rxk2lX6bFdCjnBz8gWromqHxkRDqHRnnexbM06Hir0RH7d9Pn
	jgqshzZ4dRY1m4zg1vo+XXXYFN2wzCkX+JtTInjqDY3eP9nqQz3CrG7IauwhoKEOP1+IPJJNgTn
	uJempc0dTITtn2x2VJJ52Lp3H8Ys3PFo0LS7qRJ7Pq7B3ianjGj+M3Hc0+ljIxeigKfaznsWJyC
	cB9LKcg9JeuXUs6vwbi19Bp0XDb3yU8pOcw3dxLk=
X-Received: by 2002:a05:6808:238e:b0:4d6:9153:2965 with SMTP id
 5614622812f47-4d72b63ec49mr5682940b6e.54.1790341339731; Fri, 25 Sep 2026
 06:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923021945.2203368-4-mmyangfl@gmail.com> <179030278530.2160803.5892691162510957034@kernel.org>
In-Reply-To: <179030278530.2160803.5892691162510957034@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Fri, 25 Sep 2026 21:01:42 +0800
X-Gm-Features: AclHuK_gINeSpMhsubRK169bx18RLVhA7P7kiUVoIOpcpYjxFcYk38Fd353bgFU
Message-ID: <CAAXyoMPvvmi4YV4BF=nWEchbd4SWtb2pmS2JVcsv=ro9SuuLUQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/8] net: dsa: motorcomm: Identify port type
 at runtime
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux@armlinux.org.uk, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:19=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit message says "no behavior changes intended", but
>   the patch changes which registers are programmed on SerDes link-up and=
=E2=80=A6
> - [Low] yt921x_port_up() chooses the XMII register block using only
>   pp->serdes and never checks info->xmii_mask.

Slop - you cannot get xmii on serdes ports.
