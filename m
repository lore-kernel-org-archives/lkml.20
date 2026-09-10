Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C6474274
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042279; cv=none; b=sZFQtZ13Xl3KiI8JoLji9rz4d5KK8esjX6zCScCzy1HvdWN2Ix4Nv7TGi0uF4U+hDxhEg6uzg4kVqa+SyclEFDwDMBCGjC31vHrnkbceuoEjTB3o/aJKsVrP4oj/eDjH7eyLHqmFyRRRfl65NfzOSwjRp1W89EuoohmP3RW/fMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042279; c=relaxed/simple;
	bh=Z4TG9gqsATkZZLxrzKjyJEmtHPOEPPy+9nNx4oYsL+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=OZcZbN+jAVQrfKG7lup16hEw5jRN1CIVgFCqwEMoSgHOVyQahQgbZUXkWn3wbBqK4dYor5nOFpdfpm2+5/DUGGbnV7V2j6sURJsgPzz4WLFPVCi1xljMlzhHCBU23S+AqWihdQx44FevBbVUJAcP4tmBDIQB6vvDw2P2tZ4HUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipp2ag1j; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipp2ag1j"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so5816648eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042276; x=1789647076; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=ipp2ag1jESoU1+rDQjDffdmrBGMdcBqm7iqrrKrjN9p3RToVU82ttLzlEItbV+oYqC
         Mnt05FA58N3D20x13y3Aziy2zwCX3wiLkg1XEEB4MARA90fGexAWgmgHlNxFBikyG41k
         7UNxpI/DuxH1AdoUG1lY3SkPmCCzjXZSZaEQ2/ZPc2c4Tkdh+4DW1XQ+JCU7Rwmmuw+G
         QwE7Ncz2JZdodPixqjLA/urpguh4yEnDdC2w62cUlnPJY3yJ77gnJrB7TbcUW7iOEx61
         4SRuZepfrRDyW42hLYKlFjQ/MPSS5XAT8eXmr89zdR5eRH5YdegvJTnJoOHxwBPgBm7a
         camw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042276; x=1789647076;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=E9CjacBHJu5lvf+AA5s32eNlvbXUF/tERdfM9kwTvsumZNORVCWrFGLiPzCM+8EM1y
         VN1gAHncNf2dv1oDqgLPvMVDeR73aFSr2opjxJE42tYr0+9y3P22Ab+lW2XxHwXy6Nmd
         QtX4mc2mAjZYMItXMMH9qjiDpPgZph7mJT/CCdbxVBn/wjCjVr57GNUyfp/nD0bhQYKQ
         w9UmNW1BY3ECBtIvh4eMMOlKbk7ISZkojxI9iV8/mEtz3mxLATuGJyskz1pEco4mHAVn
         s2bev+ERfxTQpIjP2+DlFzvF4XqMXc87oAGO/O12Li3VjquR6YLnPG4eHVdm5TRKeoIm
         px/g==
X-Forwarded-Encrypted: i=1; AKwUvBw8ImkGzklSFIpDa+Bo1oVj7zXF6ZuuttnfZARlarAIkf2gSgSAZtTCPdfAsR3qCSrohEGf7gu5CmXkAdw=@vger.kernel.org
X-Gm-Message-State: AFuF++les1y0uk7gi3qCp/3KODr99+yX9dOi7BN1DWDK0lpQZC8VYllP
	I+hdwfLd0rOnijql/UcvgxmmjaIDnNCpST6Sng9SnsdLJSgzasMOU8U=
X-Gm-Gg: AYBFou1qle8wCeG756q/1tOqH5I+MwanV6Dg7jsiu1HjkVDv6+gRJpsPgd7Kl2LY50B
	gom3U1eKT9MQvF9NqFT73s8fEwzPq7y6PWyzMResopPUrnqdYS14iX7XDfzbdp2lht63zk2X446
	0XMT000xowCQSsf4q5CI5iiQXdm2UH9xEDIg2U2PI6fyM1lQKnnLTP84nCIoxvDdxRK4YsnuRwL
	d2wY4QNpaDeLG+vmd7z60CR01xHCnFoU1H3J89Wv4W6MIGUOh5iV2blpGUnm+DbfWoCS87143Hd
	AsIUGzNRfZaSwlRb1GhSVVfu4hctUX0kpje3NbUmy2Qy3tpsQEXZz/Wxakx9sjQviPiHKnTynek
	+4o95oaFO029l1Vy4D9aGb+LhCXc2GZ2H7f+lVj4KcX7F3UU0cpuV9Tc81ZlwzqlDxr9g1d+CPd
	Ee/Rva57PsR69Ed3aYKbPNpPWX6msJ9S5pJMBWEz625ztzWBc0xAFahK6I2/0cxJRAQckwphL/i
	wRwmAMv12r1adkUcQGnxUQ2hgN85N/Y3rpBg/X/Ck0dhvEF
X-Received: by 2002:a4a:e84a:0:b0:6b1:4a71:775a with SMTP id 006d021491bc7-6b6fcbde97emr22252414eaf.19.1789042276189;
        Thu, 10 Sep 2026 05:11:16 -0700 (PDT)
Received: from matheus-note.localnet ([2804:7f0:84b3:2201:fb27:8354:17d:2bcc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm53156354eec.26.2026.09.10.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:11:15 -0700 (PDT)
From: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
To: andrew@lunn.ch
Cc: 25181214217@stu.xidian.edu.cn, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, b.larsson@gmx.com, cjd@cjdns.fr,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 dong100@mucse.com, edumazet@google.com, enelsonmoore@gmail.com,
 han.junyang@zte.com.cn, hkallweit1@gmail.com, jes@trained-monkey.org,
 krzk+dt@kernel.org, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, maxime.chevallier@bootlin.com, naseefkm@gmail.com,
 netdev@vger.kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, vadim.fedorenko@linux.dev, wangruikang@iscas.ac.cn,
 xuanzhuo@linux.alibaba.com
Subject:
 Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221 ethernet
Date: Thu, 10 Sep 2026 09:11:01 -0300
Message-ID: <0bwM5hNxQhuX7GLiig7ffg@gmail.com>
In-Reply-To: <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> That is a very unusual phy-mode. Is there a reason this is used in the
> example?
>
> 	Andrew

the GDM1 and GDM2 behave something similar to the newer Airoha, we have an MT7530 connected to the GDM1 as internal mode, and the GDM2 is also an internal one that communicates with the xPON and xDSL subsystem.

the en751221 has two mt7530 switches, the dsa0 limited to 10/100Mbps and a dsa2 1GbE connected to port 5 of the dsa1 in cascaded mode, but it varies from chip to chip


