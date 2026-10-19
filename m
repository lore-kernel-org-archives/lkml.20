Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7894C49502D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396551; cv=none; b=iZoqaCl+4lAysUNGo2V7PwPsQg3AwPZNeqHRjtSoBnQECi7wJthbgFcqbRHFe0S/ctOK1yJhsPxavbvpO+tivK2sPCZzkMX0vyqHVO/aSSEWV/ZyfthxKlw0j0xDmlyhaw0tWl/qTzyzI0GElmVPzg7KTVT1PVT9JdhxVr+sXJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396551; c=relaxed/simple;
	bh=mlAe3AjeK9BYZYdxRq/4nX4DbKBku7NFQCg/IxQ1uPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m7kaaTvc0Mj6Xn1XknRCw1X+vR6FULPc4PtR+fVEkJHFDFED1hHj1Zm4jEUDJ4QoKVWb2oTzZ95DJrS7S0SxNS9flRdtDBzYYTs3Tp85HujBnwuvGg2aJGELLK71Dti1pkxNHg2einLm8l6NDJQ+wT3rQNugVjM7txWIgryf7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvC3r+fF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvC3r+fF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1037482f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396547; x=1793001347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlAe3AjeK9BYZYdxRq/4nX4DbKBku7NFQCg/IxQ1uPE=;
        b=TvC3r+fFHLYOhuYXGnGj2B8H3XJK0L86CeP/pEo71zfD6bDMQqOvfKPJ1WgpePMPMY
         7SgkGJJyQC7RpjuEptXzYel6VrM82rvmZ50NGqxz2yzmq3bZmEmgtbfQtvTeeykjdWVw
         am0ez8M90Zq4vyfr3/6kkofUzPj+BhsMu72Fiw5tmowUujbFKQS1Du2xO9YWnYCrszys
         GnR+VD5lAQOKi2fD0haCBwk0AmYY24dRDWnZ9aUnEjox+afTGvkiZHYADKmUL7+cVZ0x
         sLVHzCMVcErnDaxcFyIzH179TLtvfkFriiF411gxVyFSQFy8r046M88L0mhqmay8FtUr
         NTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396547; x=1793001347;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlAe3AjeK9BYZYdxRq/4nX4DbKBku7NFQCg/IxQ1uPE=;
        b=wjxutU9bfRwtsrNvgeNyBx8sjxZeYd5f0dnvqybxdUxcZ7oSh9jqJGBhhGueUD4PBv
         sLTdlYoGtDNba37Z/PvjB7ba7/ZF22V1CkxeqRcYFQQZWsGy+jm6rAlty8zdjUxqfAio
         vBvgdTrjsQnKfEAldRxlEvxyXaGn7u+X+SMJo2uwDKc97OozLtEpgpSSKqyywe6+zgry
         ADOw70DVXLSl8QssFPvvn1a6WUxp9QQwiO03nxoFfGh7z0vFpbSTB8UX+stmmvc6r3AG
         VxUqsFAoXzKIo9MjIy+hjf9eIFU37hIrmV4VlnA2yhZrBVTUbeIFUo6fzvYtnM0K+J9X
         Bicg==
X-Forwarded-Encrypted: i=1; AKwUvBxkrA+jsnFsOLN6CXDSyDiNOh35Yosh34sAict2rJuLrcQP6pqm71JvLacQKwRSPei40l6XN8mdIshDDj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZplYOCYb5RooesXyszbjZJsrhgm3PztioMQyhEM3bldrVPGzq
	rzKXiaqX6DLNJ2sncMidxLW0oVSOjMdVsE/jIhh5yGtqsoRd2jDHpPfN
X-Gm-Gg: AYBFou3Ks/d+lRDz85L/w5HuQ0Stpozs8+7YDgtiOY5MHufMHxVp9FI6lreVpriI+Si
	3B/uaXgsJ27IJdHgUvvudTobTS4QaxNOuzk/29o0Eis9udV8jn9nxJFOcFRaB7k6fJZ5VM71M2M
	9MzmGR87V3IAteKaGxuTkPBUv6QG8/ZsQeO9V3H3s2G8tySoQ6kmeaNXfMIVv+RKMYFVD18Rmoe
	Mx8NjEy7MC8pVnBXwHqM1OMyQMXYyPO/VGt+6AaZuW1U8kz19mARKH+RVHpussZ2C7JUyQDiv3M
	z9p1aAJe9YhaI7+WplkwS4ac1Rmp0rlkdbTmo2n/7sEHcKkxr7lHK2LGZH7ztA/aON7Yj3SOnoW
	2120BKnwLdgajnyBua7ey2q2LjY0KFZ1nQrs1h2m/DP4AWeAe3e8nh6hQHjKlzJhESLIl79uM+Y
	jdwNQr1X0k5Tnv6EDo7v54eKbRQSxafxZfXibzm4osWsRP/0CFq1xqM5FXw2tPDLBfCO4GkPzRb
	UeD87tcPBL/pBNJzmEicY788xlTNoWvxgljjRP5nth56J/ycZ8z8gNtyesl8Hd9R2p7SIBS
X-Received: by 2002:a05:6000:4549:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48e07bbe545mr8225776f8f.12.1792396547354;
        Mon, 19 Oct 2026 00:55:47 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm23031367f8f.25.2026.10.19.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:55:46 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
Date: Mon, 19 Oct 2026 08:55:45 +0100
Message-ID: <179239647935.15604.9766459518321501523@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7247f5b5-5eba-4afe-8287-19731e71d4b9@foss.st.com>
References: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com>
 <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
 <20261016145542.37322-1-geocausa@gmail.com>
 <7247f5b5-5eba-4afe-8287-19731e71d4b9@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 09:49:42AM +0200, Benjamin Mugnier wrote:=0D
> Of course, I apologise. Here is the correct tag :=0D
>=0D
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>=0D
>=0D
> I think you'll need to manually remove the wrong tag for your tool.=0D
=0D
Thank you, Benjamin. I'll remove the incorrect tag and keep the Reviewed-by=
.=0D
=0D
Best regards,=0D
George=0D
