Received: from mail-qv2-f42.google.com (mail-qv2-f42.google.com [74.125.230.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CA3E00B4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367588; cv=none; b=fKZNNCY6bIJEBqDqtyyHIFWJjI7nKoFKvUgLAh2RDj043Fkkbwm/70CKciQAfQ7eR31o+CfW7MRuPrv/rMbmzY3ASIwDa7WW9X2bwGYYEYrzcjLVt06wDnwTjY0iCKUna/nz8BOXwq8T/R/klYTwdqT/Nr93cgut74P58/RrnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367588; c=relaxed/simple;
	bh=K88g/NRBGmhTSI9GMeLUT029uyZ4Jq4cmaHJJxQ8Vt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cb3j6l2AK69eE9OBTpjnR97TaCKHnpiUXuTN9XZSgrALdwAxeBMP/DLSBaKGQFQJJEK8xVCplDAwA23B1aUFsaOHjHSDx+iZSJJQvMyv2N81s31RtMuyvql3d/HWFyc/lDVALyga+gI3M/9K5fwQZc7OUIiYuEvkEYQ4EjI4FG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrC+BULQ; arc=none smtp.client-ip=74.125.230.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrC+BULQ"
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-9143e192df5so5686746d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367582; x=1790972382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K88g/NRBGmhTSI9GMeLUT029uyZ4Jq4cmaHJJxQ8Vt0=;
        b=FrC+BULQVYhb1/j9jrOUrqdt/ZYfxlJiVnfWyHH3KaXcUwIOvVixCVhQNozo31vmS7
         nPPghoSW4SWNs0qmgGofdVV1ntYUaux66bibh2u/NXVajshJOJWNrzOlnoEcRt4XV+mE
         +lXhHb0YT0YnYcLcLbx/JLMyVi6KrNwio9Bc8HSHrfH3doGhu2epr50C2mnWKM9lFk9N
         gB7mS8Xkz0//8RKAq6QeeCNwiOlmSpvR1IoOAHzbUIHd45Yk7IThWiuBPTV1JCKmMRtu
         qO/T7Rfb6T2hNiBzQEgN/S3cz3wDY4q+nFyAeLlzqNZMGI1Eqc3DgKuB6gJCWJy38P+B
         Qzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367582; x=1790972382;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K88g/NRBGmhTSI9GMeLUT029uyZ4Jq4cmaHJJxQ8Vt0=;
        b=DiaLs/2D/2FXzXSevMEF0VSmjaU/vVOelwrSnsY9eWbqdh8rIEL/kFfeceqVOqLoHr
         XvXqTjdyw86h0jdOaooBSTjPJl3zPUedLP3CeWjWVFEZUVHgU42xZoa7po0E+b2u7Mpx
         q9RwKCb3Y7EkiDCGv8wqdEgZi2jaPkZAz7+7e1Tzi13XPTPWujaarF+TO+BGZYTsyerd
         qLO2tt+9YOuZSqg2O/k3oRqWNf3BSFVGsA873yofoQkeHdMdbfvJEkPO33HqsBX+wZeD
         SEBfA0ZoXflRlqq/+NICuDJUqVgkUCbbVObjUQnjxJ9JivXt+2+RpWl20xsDbn4n0tFG
         WHCw==
X-Forwarded-Encrypted: i=1; AKwUvBwZlYMcEZ3Jg5K9/9exuvXZ4ac2FVcwMf+AFpGma4CJlBh7g9GvPKhA6MTdljtCixwiF/rZI2trvmx5HWQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nacOqjBnuyJKeIbAnWKECsKmspxSWm15+r10q+Eth1alm2SVtB
	IG3ioPNFcRY6HsRKZoSM/GS8oCcjNKNlnQxjEEWPt6NaBk0yYwVuiVTkTfCuh1VLwtg=
X-Gm-Gg: AYBFou03IfUgG28R5MN2x+HsRva34NBgaKLQkhYjV6VKPdY+Wia85m8LZ+MBTLUWpAm
	3+p04euwYZSnbTOFjF3UVCZ7uIwb4oVmFqVG95+yQEIzJzvA9mSHZta8ai+u2LiUZMPA2Af7n0j
	7qB566Cx16bbcHetNTawXdz1oZzVSncDOP6D5+GDLyueKPitT1JJYlHBO1+dxv2+mlYp4Eg9cmC
	iG3KbIAL3Zr9hiq5I1oeGq3HiO5oQ6lwwLQTIls1vLABIwqnzmD69Obs/nzZpxMV7RBdREMkLKo
	gJutIrXvJVrC5lnf0eynncmAk0X/0QilnWZAwvB1Y8mhXEXP9RcxOIkBAsqaszmjEUVLpVlGw2h
	0lqm9EdoTU4lrVXZu7w6UUSFJAnsrxADrXE3AvoT8YuvHU575qfEFkonYiq97jA2VxBIkaZyP3y
	6z5Aj72JnaxJROpH6vFND4hcv2Uf2AHNDZwzkXX/SqpJLZy3drmDPXfkY5awXh3iihGbKCvY98+
	AaYn0ZQG0MyHSBAeQO9UbutIDgRpCnUfJONmu5KMC3uE05rEuiTcM9zVUDyblUN8Qf/Kp9dhMM/
	u17rhxtTo31+2sMjkX5pQ+8jSWm9MXDJykLGqJRDyuxzkh8VuBwCp6rIUjUPmNgJM4p7XslUxAv
	YJGOwhfNJRFT9pNwBLAhm6PHQXX4vNAauUqlqJgV/Zf7CalDi1ycwZqU=
X-Received: by 2002:a05:6214:d45:b0:912:3c52:5e72 with SMTP id 6a1803df08f44-9142f08e731mr60599636d6.0.1790367582365;
        Fri, 25 Sep 2026 13:19:42 -0700 (PDT)
Received: from edhar.longhair-great.ts.net (pool-173-48-206-252.bstnma.fios.verizon.net. [173.48.206.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a24c4sm25159636d6.6.2026.09.25.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:19:41 -0700 (PDT)
From: Zack Gomez <zack.gomez@gmail.com>
To: leitao@debian.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	stephen@networkplumber.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3] netpoll: bound the deferred transmit queue
Date: Fri, 25 Sep 2026 16:19:40 -0400
Message-ID: <20260925201940.1950809-1-zack.gomez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <araTwjYJRMlfd2PX@gmail.com>
References: <20260923181111.1182838-1-zack.gomez@gmail.com> <araTwjYJRMlfd2PX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Fri, Sep 25, 2026 at 08:32:56AM -0700, Breno Leitao wrote:
> I don't think this should be a fix, honestly. I would prefer to see this
> on net-next without the Fixes tag.

Agreed, I'll drop the tag and send v4 to net-next with your Reviewed-by.
Thanks for the reviews and I'll be watching your patchset as well.
