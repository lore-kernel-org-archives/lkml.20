Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3E4AC167
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380756; cv=pass; b=jiqp8lD0f/0wi9LS96zRhhpA6yC0CMH1beyrmGiRvCUe7DUz18pYcQ+pKuAoSZxTmt3MLZHyEaZcuJ8pdaWTVlhD1EVnvRq5pmSAqDiD10oBeokV1KXhq/2r+CDkkgLmgq9IMHsgKF1I74mWXngnScLDPO7wi9ujN8EFgGbpAJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380756; c=relaxed/simple;
	bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtFIArblgbG7FIx5StmU3q3t7Q6uayvJ/wM05X/kQd0UbOjR+KVUqiaA6MMOUIl7H4aEfVxVCOeSgM/6ZjT5eq/17jTKiI6OTpPRXoulj8fX1NDtKQHFdwXCjsueWl72VpcKYOd3Djhf0+h4xtFIPqas7NiSNQ9z29PxZOvISwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XYxkz+W0; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XYxkz+W0"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so8737e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 06:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791380745; cv=none;
        d=google.com; s=arc-20260327;
        b=bdUCVep2U4Q4Iqjl/jpdzhfli6Gj6K+Rj9xvXqzlkHg1nguyC8GB0VlRzZxIfbsliB
         kuxVctm0mLkp95u6pkU4UHs9NhJBZzJ0Q7qZgIoIpz5CgcoObavnmWT486Bb0S9Hb5pE
         50qMAbuYHtT40v7LrOydPJZP8X3Q7nLw/eX6+zvUyziHzy0E7JOAayG1yTU/Ie7dI650
         dxPSnOlQr7ABsjNGZFRS9LVzQecOHAH5ftlM9fN5hMRuXqeXyUMUCpwvTrb4q8M69/hM
         Tw2gZNlfjpKBXcJd3Exo+RNNwE2IqbTlBnNnl+dCbr2uLL+1tMvIuOljIiYUBfSH8c8p
         66dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        fh=DLf2APtr9a4cHxtra0q8bVkZVz07bBn7QMvmxBkH5bg=;
        b=Nj4ODV8w0XreX68w57gu4N6Qy1GkMzjImF1hE91FNA1nxEm+pOb9gHdLR9/zEg3r0o
         F5QGF5OxzlXonplQgiEN0k8/M5cpyY/40LU4iBif2uSdnhV5RAk2bxUJM3fDNddlgSsa
         8a1E7FAcs9dZ4AqKz68gvOhGvH9Iwzy7Hiq8jui3hDUACn16tgk8D1cmiedERJUKEBuR
         q3XywpkGiu209AsZgHTicNFz2RhYlBiVZzRIsfBOEvmqCw/6dO0JB9tKCnok9DBZpATz
         fITekZpsv7vsqb6uDig+UwmiiUFPZjFtmKmc/1Rui3sQf+6cohsRMGmIDUBTD2awT7n/
         ra1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791380745; x=1791985545; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        b=XYxkz+W0oIQZd2ng/uaARCv5WCqKJiG2raclhhxX+4CLNeI9Gtjf+T9FdhVOkI6hga
         Jb/RlLZdujYxzAD5BwRUfk/+5i7C0UQ/BZD7eW3SzTBUdmIzrq23MPvtJXM3Cr46V1sB
         gASDKqGa1u3p0BUQ+kBqRLt7gn1Yhfq4ns7HpSWR2xHpccW6ORy81XxifxIlRa5gK1Gv
         FkAJslTnmlcF0TFYzjW/qdqZvKrafMrfYhST7KKfaEXfnF4BQG33olzG4yb9XWKybB6u
         f1q6dxef/9DXopWBfelknkQTmMJE2LEzhnISVVLvzCwXM/d7SFugQl2eCxOzLdld766v
         V6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380745; x=1791985545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        b=AdSx63qaQplUbMXkLAIG7KpjIRh+D0cKdoSZFxEhNLC1N1bJMBRbxWZJyzXNTrh5HM
         pTkMX2Dl9ss/DmQ1CiNeBOM+J1NMhX+5r6GtEgqzjrZhOmJIfDSzvHkaqVAyEiX6ZxHe
         Fyv00SRLILZ+1sYJdDurcapglZ/A7m8d5G6bbBNCGmStS15bzG38dNZVVt/4qSxhjqiz
         8V6pSlt2oG/WncdhOZplMthj0di7T/oFQVEJ1iw+wYYUgl2cBEvnjlSUB43g+4ki/Euw
         FbCIrb17o4NstQ73Cy7U7KNDr3PD9VxMSv89bgRB6Rx2HTyNuaaOuQ74pGt2tleM8R1n
         U5Nw==
X-Forwarded-Encrypted: i=1; AKwUvByhylb7Y+Jvlbpfm3M8jlMDz5dzqSpq04d9rPTsN75zUNMq0dcXFlkVp88mr8Fu11rIDBMqK+xOrrtS3SA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE6l7pF2uyZyTPUYMbOJOyw14+qvY+EAl76gBkk72QUZcMbrWH
	ZL5kzHCElZqhfWNjS6DDQp1eJAzWHWo62ncSsH+paAAET8UU57slor6S7A6Dd341nbfTqt73vzj
	Z5z2UN99LzSOHerKK4qzwAOAy3PkoDIoPM4LqguTi
X-Gm-Gg: AYBFou3Syvczwwk8hU5d0f83g8Su76QMjCGu4jM9QzAEm/ZQMZejTWkwKtpDmcOJBns
	vrwCultiP2gB0C4cu9CY9Db7p5Lc0v3AINE6RS86v2672WrnKB5W7I1bQQgDAVnQoPoO8Y9uo+T
	twbxvtv8TfvxBRmtWv9+gEBUmoG4GJ08lRz3eLqlZDuZcU/Mkx2z6N30cVDzZ3bvaLVjCUQB6u3
	7ah8tOdVFRiRmXpv/CVt3uTOdycKbZKymQgP5ZFRrNIQ2zyMKkLy+azPK4jQqc0hsA6LJGj4Ufv
	kvcGbUJ87Bz5cNhPM0iTXKTADY9xOgD6Qh8BNgMIJYIUyXauvr03UBk/
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr320554e87.14.1791380744549; Wed, 07 Oct 2026
 06:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-13-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-13-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 15:45:07 +0200
X-Gm-Features: AclHuK9NBZeYXTKdDsAbHTEgR4p43Lr3P06clWDgtHoGILzFBEkx0SOT-Ggr9gA
Message-ID: <CA+EHjTxuAh1zegQGA0-dNAjDBnXUc036WhoGxoUvVmMW1BxdXg@mail.gmail.com>
Subject: Re: [PATCH v23 12/14] KVM: arm64: Abstract out memory abort handling
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Move the memory abort handling under VM specific s2 operation.
>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
