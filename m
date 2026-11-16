Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843110;
	b=ibuNJ5GB+O/8fMZLY+MoUogiXBzsfSPJOj2eFs/60gnLrBiijmNeqEymUF3njf9YMFmV
	 TBuUfgnNoE0GzgU5ZaOKfhqAt9BRk79WaJa5628uC8q+1CytX8hSYng8mJxVfQXCE5D6J
	 NeEbnyF7LJaw2xsc8+KbRM016BeXy/YyLs6vKFDEy9x0wxE2fqremileN7fDMLQjrBT1Y
	 uZY/TqftVXroaL6JKHIg6R2/Uhu1yrTH74FUzxN0qf/1/755EwOfYTO5Qewm0xFrw4EGE
	 +4HptfdHyqPAXFDWfMeFi5CzxkXQcxT8GBvOfFCUAfeplWPEUyg/3IIi/FvdAtfz3lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843110;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=+QscH+jagTuHXsFfO7lF67rDfjKOaTFZf6zMwgoYAIQ=;
	b=kk7c+zZu5G3PYZhVNkkOtVsn4JfG1vTq8HLnMznoW/FzDuQUEi0d06jY8nPB4QBrGLAV
	 Rdz0Zp7BTV4+u19fQ460bMf5ZmbDvqOPmtPdrDRZy10dpaLBmWiT4CLVZRZX5GnJLkwaS
	 raTpOSvGbQBWQk1LaEV5OyXNHHsooifc9+OkcEqUZ/49jBSIO4hf1meBEcXxrt1hIWoWo
	 uPNbDIJHKBM/XYEg7q6aQkZ+3aOuzYtobqAIZbVoXHoGYyxcf7uULPuLX9nHrwqrC4MEo
	 O9sB6PJ9zltG9Xcdo4pEuRpfPubRodBJib9l0Kjmiig2iys90sDf5XUN+fuSKLE2L5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=uzVTRAa1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12059606A323;
	Mon, 16 Nov 2026 15:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12059606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=uzVTRAa1
ARC-Seal: i=1; a=rsa-sha256; t=1794842904; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mztb0mL3j+urnyGbotMHzolkcNSBVYm/MF1w5n4C8qHvd9dl+5ckYK8yu4mEhk57YzdN6AhZB3qYoBiCopuwadfpke45Q4mOSEe+xzG42nR0D1lqDF1b0VZNpBGu93E30O8dLKnCuNIEwctiXYTekXXhjXm2r27OpDLTJgMOsBA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842904; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+QscH+jagTuHXsFfO7lF67rDfjKOaTFZf6zMwgoYAIQ=; 
	b=hekTqZlujU/i4ngkhvPgLOjcRtXROCNaRQVBpOx0+sZ7guXneI0bUh38F3XRcVGev5DhrYcrynQRCYEGWrV9kgcsbk7QnPwQiidJdBBdG6uoLRvZ3zVWkJLaqlW/qZb+1Ykoc/dtCpDo4oH7NFq2fKQ+GCnV4AHEcSEWeVLOtYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=uzVTRAa1rArdFOPK5dy2rvYSLuBNabtFB3emxCDojecirYBygt2Ao7OWVy2Pag1ZxDuTVCk0TVHc6peQAeWuXNhEsWf+3sFqHjqkrpqDD6Wbls8oSwf+A+UE5VQlt0BHOGVUhpgVZyr1JHXbnbP0nIDsTl8juqN8rH8q7YXt7zAH/f+9I7vtfw0x15j0sWpxGaX9sAzYte/pq+xH5saZ4PwH9kHQ1lKbPK8+THjeLNr2Ct8eFQy9CbqGzjMupjQLjXbhEHx4Yw1cDs2Yj7s03iPNbHzFE+kzW9WIrDrLbzJI947bL/7Ozzz1fqfeUWivD1YfKqItqCABmM7Z8ON4ig==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=+QscH+jagTuHXsFfO7lF67rDfjKOaTFZf6zMwgoYAIQ=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842903310741.5675063276868;
	Mon, 16 Nov 2026 07:28:23 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 05/10] wifi: rtw89: use AP self role for monitor interfaces
Date: Mon, 16 Nov 2026 20:27:57 +0500
Message-ID: <20261116152804.781-7-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <971ff7a2aa6e4f5bb6d4e459c386d433@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-6-owner@ph4ntom-rev.uz> <971ff7a2aa6e4f5bb6d4e459c386d433@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Sun, Nov 15, 2026 at 04:08:31AM +0000, Ping-Ke Shih wrote:
> Describe why you need this patch. Which problem you encountered and
> wanted to fix.
> [...]
> I'll check firmware people the setting.

Without this change, raw frames injected on a monitor interface are
queued by the driver without error, but nothing is transmitted over the
air because firmware silently drops frames queued on the monitor MAC ID
when it was initialized with the default client role and disassoc = 1.

I will rewrite the commit message in v6 to state that problem directly.
I have v6 ready (trimmed down to 6 patches for single monitor mode) and
will hold off sending it until you hear back from the firmware team on
this role setting.

Thanks,
Enver
